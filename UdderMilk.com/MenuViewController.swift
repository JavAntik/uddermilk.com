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
        menu.append("test")
        menu.append("test1")
        menu.append("test2")
        menu.append("test3")
        menu.append("test4")
        menu.append("test5")
        menu.append("test6")
        menu.append("test7")
        menu.append("test8")
        menu.append("test9")
        menu.append("test10")
        menu.append("test11")
        menu.append("test12")
        menu.append("test13")
        menu.append("test14")
        menu.append("test15")
        menu.append("test16")
        menu.append("test17")
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