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
        categories.append(Category(name: "Eggs", description: "cow's milk products", image: "eggs.jpg"))
        categories.append(Category(name: "Goat Cheese", description: "cow's milk products", image: "goatCheese.jpg"))
        categories.append(Category(name: "Honey and Maple", description: "cow's milk products", image: "honey1.jpg"))
        categories.append(Category(name: "Cow Diary", description: "cow's milk products", image: "COW1.jpg"))
        categories.append(Category(name: "Grass-fed Meats", description: "cow's milk products", image: "meat.jpg"))
        return categories
    }
}