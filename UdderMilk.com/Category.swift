//
//  Category.swift
//  UdderMilk.com
//
//  Created by Anton Baranchuk on 9/4/15.
//  Copyright © 2015 Anton Baranchuk. All rights reserved.
//

import Foundation

class Category {
    let name: String
    let description: String
    let image: String
    
    init(name: String, description: String, image: String) {
        self.name = name
        self.description = description
        self.image = image
    }
}