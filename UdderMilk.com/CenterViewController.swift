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
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}

class CenterViewController: UIViewController {
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var creatorLabel: UILabel!
    
    var delegate: CenterViewControllerDelegate?
    
    // MARK: Button actions
    
    @IBAction func kittiesTapped(sender: AnyObject) {
        delegate?.toggleLeftPanel?()
    }
    
    @IBAction func puppiesTapped(sender: AnyObject) {
        delegate?.toggleRightPanel?()
    }
    
}

extension CenterViewController: SidePanelViewControllerDelegate {
    func itemSelected(item: String) {
        //creatorLabel.text = animal.creator
        
        delegate?.collapseSidePanels?()
    }
}
