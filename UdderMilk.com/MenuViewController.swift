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
    var categories: [Category] = [Category]()

    
    struct TableView {
        struct CellIdentifiers {
            static let StringCell = "StringCell"
        }
    }
    
    override func viewDidLoad() {
        categories = CategoriesLoader().getCategories()
        super.viewDidLoad()
        tableView.reloadData()
    }

}

extension MenuViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.StringCell, forIndexPath: indexPath) as! StringCell
        cell.configureForItem(categories[indexPath.row].name)
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