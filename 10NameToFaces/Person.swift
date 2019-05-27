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
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
