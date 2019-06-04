//
//  ViewController.swift
//  10NameToFaces
//
//  Created by Saroj on 5/27/19.
//  Copyright © 2019 Saroj. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var people = [Person]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(addNewImage))
        // Do any additional setup after loading the view.
    }
    @objc func addNewImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true)
    }
    
    @objc func addNewPerson() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    //MARK:- UICollective Delegate
    
    //--->> numberofItems in Sections
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    // ---->>> cellForItemAt
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonViewCell else {
            fatalError("Unable to dequeue PersonCell.")
        }
        
        let person = people[indexPath.item]
        cell.nameLabel.text = person.name
        
        let path = getDocumentsDirectory().appendingPathComponent(person.image!)
        cell.imageView.image = UIImage(contentsOfFile: path.path)
        
        
        
        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = people[indexPath.item]
        
        let ac = UIAlertController(title: "Rename Person", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        ac.addAction(UIAlertAction(title: "OK", style: .default)  { [weak self, weak ac] _ in
            guard let newName = ac?.textFields?[0].text else { return }
            person.name = newName
            self?.collectionView.reloadData()
            
        })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    //MARK:- ImagePicker Delegate
    
    //----->>>> DidFinishPickingMediaWithInfo
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage  else {
                return
            }
                let imageName = UUID().uuidString
                let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
                //convert to jpegData
                if let jpegData = image.jpegData(compressionQuality: 0.8) {
                    try? jpegData.write(to: imagePath)
                }
        
//        guard let userPickedImage = info[.originalImage] as? UIImage  else {
//             return
//        }
//        let imagePicker = UIImage(named: userPickedImage)
        
    
        
        
        
        let person = Person(name: "Unknown", image: imageName, pickerImage: nil)
        people.append(person)
        collectionView.reloadData()
        
        //dismiss the topmost viewController.
        dismiss(animated: true)
        
//        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            //imageView.image = userPickedImage
//
//            guard let ciimage = CIImage(image: userPickedImage) else {
//                fatalError("Could not convert UIImage into CI Image.")
//            }
//            detect(image: ciimage)
//        }
//        imagePicker.presentingViewController?.dismiss(animated: true, completion: nil)
//
//        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}

