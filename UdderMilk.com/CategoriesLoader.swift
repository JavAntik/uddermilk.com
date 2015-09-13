//
//  CategoriesLoader.swift
//  UdderMilk.com
//
//  Created by Anton Baranchuk on 9/4/15.
//  Copyright © 2015 Anton Baranchuk. All rights reserved.
//

import Foundation

class CategoriesLoader {
    func getCategories() -> [Category]{
        var categories = [Category]()
        categories.append(Category(name: "milk", description: "cow's milk products"))
        categories.append(Category(name: "meat", description: "beef, pork, cheaken"))
        return categories
    }
}