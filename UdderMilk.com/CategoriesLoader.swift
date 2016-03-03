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
        var menu = [String]()
        menu.append("Shop")
        menu.append("  Fermented Items")
        menu.append("  Cow Cheese")
        menu.append("  Beauty and Heal")
        menu.append("  Condiments, Salt...")
        menu.append("  Eggs")
        menu.append("  Goat Cheese")
        menu.append("  Honey and Maple")
        menu.append("  Grss-fed meats")
        menu.append("  Cow Diary")
        menu.append("  Certified Orga...")
        menu.append("  Grains, Couscouse")
        menu.append("  Sheep Diary")
        menu.append("  Minimum Order Adjuster")
        menu.append("  Healthy Snacks")
        menu.append("  Preserves, Jams")
        menu.append("About Us")
        menu.append("Videos")
        menu.append("Articles")
        menu.append("Recipes")
        menu.append("News")
        menu.append("Contact Us")
        menu.append("Pickup & Delivery")
        var categories = [Category]()
        categories.append(Category(name: "Eggs", description: "cow's milk products", image: "eggs.jpg"))
        categories.append(Category(name: "Goat Cheese", description: "Goat Cheese products", image: "goatCheese.jpg"))
        categories.append(Category(name: "Honey and Maple", description: "Honey and Maple products", image: "honey1.jpg"))
        categories.append(Category(name: "Cow Diary", description: "Cow Diary products", image: "COW1.jpg"))
        categories.append(Category(name: "Grass-fed Meats", description: "meats products", image: "meat.jpg"))
        return categories
    }
}