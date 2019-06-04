//
//  Person.swift
//  10NameToFaces
//
//  Created by Saroj on 5/27/19.
//  Copyright © 2019 Saroj. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name: String
    var image: String?
    var pickerImage: UIImage?
    
    init(name: String, image: String?, pickerImage: UIImage?) {
        self.name = name
        self.image = image
        self.pickerImage = pickerImage
    }
}
