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
        categories.append(Category(name: "Shop", description: "shop", image: "shop.jpg"))
        categories.append(Category(name: "  Fermented Items", description: "shop", image: "shop.jpg"))
        categories.append(Category(name: "  Cow Cheese", description: "shop", image: "shop.jpg"))
        categories.append(Category(name: "  Beauty and Heal", description: "shop", image: "shop.jpg"))
        categories.append(Category(name: "  Condiments,salts", description: "Condiments, salts, sprouted flour", image: "shop.jpg"))
        categories.append(Category(name: "  Eggs", description: "Eggs", image: "eggs.jpg"))
        categories.append(Category(name: "  Goat Cheese", description: "shop", image: "goatCheese.jpg"))
        categories.append(Category(name: "  Honey and Maple", description: "shop", image: "honey1.jpg"))
        categories.append(Category(name: "  Grass-fed meats", description: "shop", image: "meat.jpg"))
        categories.append(Category(name: "  Cow Diary", description: "shop", image: "COW1.jpg"))
        categories.append(Category(name: "  Vanilla bean", description: "Certified Organic raw vanilla bean powder", image: "shop.jpg"))
        categories.append(Category(name: "  Grains, Couscouse", description: "cow's milk products", image: "eggs.jpg"))
        categories.append(Category(name: "  Sheep Diary", description: "Goat Cheese products", image: "goatCheese.jpg"))
        categories.append(Category(name: "  Minimum Order Adjuster", description: "Honey and Maple products", image: "honey1.jpg"))
        categories.append(Category(name: "  Healthy Snacks", description: "Cow Diary products", image: "COW1.jpg"))
        categories.append(Category(name: "  Preserves, Jams", description: "meats products", image: "meat.jpg"))
        categories.append(Category(name: "Pickup & Delivery", description: "shop", image: "shop.jpg"))
        categories.append(Category(name: "News", description: "shop", image: "shop.jpg"))
        categories.append(Category(name: "News", description: "shop", image: "shop.jpg"))
        categories.append(Category(name: "Articles", description: "shop", image: "shop.jpg"))
        categories.append(Category(name: "About Us", description: "shop", image: "shop.jpg"))
        categories.append(Category(name: "Contact Us", description: "shop", image: "shop.jpg"))
        return categories
    }
}