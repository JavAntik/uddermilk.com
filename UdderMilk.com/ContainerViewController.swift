//
//  ContainerViewController.swift
//  UdderMilk.com
//
//  Copyright © 2016 Anton Baranchuk. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
    case AllCollapsed
    case MenuShown
    case CartShown
}

class ContainerViewController: UIViewController {
    var centerNavigationController: UINavigationController!
    var centerShopNavigationController: UINavigationController!
    var centerViewController: CenterViewController!
    var menuViewController: MenuViewController!
    var shopViewController: ShopViewController!
    
    var currentState: SlideOutState = .AllCollapsed
    
    let centerPanelExpandedOffset: CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerViewController = UIStoryboard.centerViewController()
        centerViewController.delegate = self
        
        // wrap the centerViewController in a navigation controller, so we can push views to it
        // and display bar button items in the navigation bar
        centerNavigationController = UINavigationController(rootViewController: centerViewController)
        view.addSubview(centerNavigationController.view)
        addChildViewController(centerNavigationController)
        
        centerNavigationController.didMoveToParentViewController(self)
        
        shopViewController  = UIStoryboard.shopViewController()
        centerShopNavigationController = UINavigationController(rootViewController: shopViewController)
    }
}
extension ContainerViewController: CenterViewControllerDelegate {
    
    func toggleMenu() {
        let notAlreadyShown = (currentState != .MenuShown)
        
        if notAlreadyShown {
            addMenuViewController()
            animateMenu(true)
        }
        else {
            animateMenu(false)
        }
    }
    
    func toggleRightPanel() {
    }
    
    func addMenuViewController() {
        if (menuViewController == nil) {
            menuViewController = UIStoryboard.menuViewController()
            menuViewController.delegate = centerViewController
            addChildSidePanelController(menuViewController)
        }
    }
    func addChildSidePanelController(menuController: MenuViewController) {
        menuController.delegate = self
        view.insertSubview(menuController.view, atIndex: 0)
        
        addChildViewController(menuController)
        menuController.didMoveToParentViewController(self)
    }
    
    func addRightPanelViewController() {
    }
    
    func animateMenu(shouldExpand: Bool) {
        if (shouldExpand) {
            currentState = .MenuShown
            
            animateCenterPanelXPosition(targetPosition: CGRectGetWidth(centerNavigationController.view.frame) - centerPanelExpandedOffset)
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { finished in
                self.currentState = .AllCollapsed
            }
        }
    }
    
    func animateCart(shouldExpand: Bool) {
        
    }
    
    func animateCenterPanelXPosition(targetPosition targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
            self.centerNavigationController.view.frame.origin.x = targetPosition
            }, completion: completion)
    }
    
    func itemSelected(itemId: NSInteger) {
        collapseSidePanels()
    }
    
    func collapseSidePanels() {
        switch (currentState) {
        case .MenuShown:
            toggleMenu()
        default:
            break
        }
    }
}

private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
        
    class func menuViewController() -> MenuViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("MenuViewController") as? MenuViewController
    }
    
    class func centerViewController() -> CenterViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("CenterViewController") as? CenterViewController
    }
    
    class func shopViewController() -> ShopViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("ShopViewController") as? ShopViewController
    }
}

extension ContainerViewController: MenuViewControllerDelegate {
    func menuItemSelected(item: Int) {
        switch (item) {
        case 20:
            centerNavigationController = UINavigationController(rootViewController: centerViewController)
            view.addSubview(centerNavigationController.view)
            addChildViewController(centerNavigationController)
            
            centerNavigationController.didMoveToParentViewController(self)
        default:
            view.addSubview(centerShopNavigationController.view)
            addChildViewController(centerShopNavigationController)
            
            centerShopNavigationController.didMoveToParentViewController(self)
            
        }
        collapseSidePanels()
    }
}
