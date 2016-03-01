//
//  SidePanelViewController.swift
//  UdderMilk.com
//
//  Created by Marina Markova on 10/18/15.
//  Copyright © 2015 Anton Baranchuk. All rights reserved.
//


import UIKit

protocol MenuViewControllerDelegate {
    func menuItemSelected(item: Int)
}

class MenuViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var delegate: MenuViewControllerDelegate?
    
    var items: Array<String>!
    
    struct TableView {
        struct CellIdentifiers {
            static let StringCell = "StringCell"
        }
    }
    
    override func viewDidLoad() {
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
        items = menu
        super.viewDidLoad()
        tableView.reloadData()
    }

}

extension MenuViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.StringCell, forIndexPath: indexPath) as! StringCell
        cell.configureForItem(items[indexPath.row])
        return cell
    }
    
}

// Mark: Table View Delegate

extension MenuViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let selectedItem = items[indexPath.row]
        delegate?.menuItemSelected(indexPath.row)
    }
    
}

class StringCell: UITableViewCell {
                
    @IBOutlet weak var label: UILabel!

    func configureForItem(item: String) {
        label.text = item
    }
    
}