//
//  ViewController.swift
//  10NameToFaces
//
//  Created by Saroj on 5/27/19.
//  Copyright © 2019 Saroj. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonViewCell else {
            fatalError("Unable to dequeue PersonCell.")
        }
        
        return cell
    }
}

