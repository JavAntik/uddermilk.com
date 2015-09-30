//
//  CategoryItemsController.swift
//  UdderMilk.com
//
//  Created by Marina Markova on 9/23/15.
//  Copyright © 2015 Anton Baranchuk. All rights reserved.
//

import UIKit

class CategoryItemsController: UITableViewController {
    
    var category: Category? = nil
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        //let myImage = UIImage(named: categories[indexPath.row].image)
        //let myImageView = UIImageView(frame: CGRect(x: 96, y: 0, width: 150, height: 100))
        //myImageView.image = myImage
        //cell.addSubview(myImageView)
        //cell.textLabel!.setNeedsDisplayInRect(CGRect(x: 100, y: 100, width: 100, height: 100))
        cell.textLabel!.text = category?.description
        cell.textLabel!.textAlignment = .Center
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }

}
