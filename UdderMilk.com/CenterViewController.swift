//
//  CenterViewController.swift
//  UdderMilk.com
//
//  Created by Anton Baranchuk on 10/17/15.
//  Copyright © 2015 Anton Baranchuk. All rights reserved.
//

import UIKit

@objc
protocol CenterViewControllerDelegate {
    optional func toggleMenu()
    optional func toggleCart()
    optional func collapseSidePanels()
}

class CenterViewController: UIViewController {
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var creatorLabel: UILabel!
    
    var delegate: CenterViewControllerDelegate?
    
    // MARK: Button actions
    
    @IBAction func menuTapped(sender: AnyObject) {
        delegate?.toggleMenu?()
    }
    
    @IBAction func cartTapped(sender: AnyObject) {
        delegate?.toggleCart?()
    }
    
}

extension CenterViewController: CenterViewControllerDelegate {
    func itemSelected(item: String) {
        //creatorLabel.text = animal.creator
        
        delegate?.collapseSidePanels?()
    }
}
extension CenterViewController: MenuViewControllerDelegate {
    func menuItemSelected(item: Int) {
        let categories = CategoriesLoader().getCategories()
        titleLabel.text = categories[item].description
        
        delegate?.collapseSidePanels?()
    }
}
