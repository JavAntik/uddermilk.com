//
//  MasterViewController.swift
//  UdderMilk.com
//
//  Created by Anton Baranchuk on 8/31/15.
//  Copyright © 2015 Anton Baranchuk. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: CategoryItemsController? = nil
    var categories: [Category] = [Category]()
    //var centerNavigationController: UINavigationController!
    //var centerViewController: CenterViewController!
    var leftViewController: MenuViewController?

    var currentState: SlideOutState = .AllCollapsed {
        didSet {
            let shouldShowShadow = currentState != .AllCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    
    func showShadowForCenterViewController(shouldShowShadow: Bool) {
        if (shouldShowShadow) {
            //view.layer.shadowOpacity = 0.8
        } else {
            //view.layer.shadowOpacity = 0.0
        }
    }
    //var delegate: CenterViewControllerDelegate?
    
    // MARK: Button actions
    
    @IBAction func menuTapped(sender: AnyObject) {
        toggleLeftPanel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = CategoriesLoader().getCategories()
        // Do any additional setup after loading the view, typically from a nib.
        // self.navigationItem.leftBarButtonItem = self.editButtonItem()
 
        //let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        //self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? CategoryItemsController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = categories[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! CategoryItemsController
                controller.category = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let myImage = UIImage(named: categories[indexPath.row].image)
        let myImageView = UIImageView(frame: CGRect(x: 96, y: 0, width: 150, height: 100))
        myImageView.image = myImage
        cell.addSubview(myImageView)
        cell.textLabel!.setNeedsDisplayInRect(CGRect(x: 100, y: 100, width: 100, height: 100))
        cell.textLabel!.text = "\r\n\r\n\r\n\r\n" + categories[indexPath.row].name
        cell.textLabel!.textAlignment = .Center
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }

    
    
    
    
    
    func toggleLeftPanel() {
        //let notAlreadyExpanded = (currentState != .LeftPanelExpanded)
        
        //if notAlreadyExpanded {
            addLeftPanelViewController()
        //}
        
        //animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    
    func collapseSidePanels() {
        switch (currentState) {
        //case .LeftPanelExpanded:
        //    toggleLeftPanel()
        default:
            break
        }
    }
    
    func addLeftPanelViewController() {
        if (leftViewController == nil) {
            leftViewController = UIStoryboard.leftViewController()
            addChildSidePanelController(leftViewController!)
        }
    }
    
    func addChildSidePanelController(sidePanelController: MenuViewController) {
        sidePanelController.delegate = self
        
        self.splitViewController!.view.insertSubview(sidePanelController.view, atIndex: 0)
        
        self.splitViewController!.addChildViewController(sidePanelController)
        sidePanelController.didMoveToParentViewController(self)
        sidePanelController.didMoveToParentViewController(self.navigationController)
    }
    
    func animateLeftPanel(shouldExpand shouldExpand: Bool) {
        if (shouldExpand) {
            //currentState = .LeftPanelExpanded
            
            animateCenterPanelXPosition(targetPosition: CGRectGetWidth(view.frame) - 60)
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { finished in
                //self.currentState = .BothCollapsed
                self.leftViewController!.view.removeFromSuperview()
                self.leftViewController = nil;
            }
        }
    }
    
    func animateCenterPanelXPosition(targetPosition targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {self.view.frame.origin.x = targetPosition}, completion: completion)
        //self.navigationController!.view.frame.origin.x = -targetPosition
        //UIView.animateWithDuration(0.5, delay: 1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {self.navigationController!.view.frame.origin.x = targetPosition}, completion: completion)
    }

}

private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
    
    class func leftViewController() -> MenuViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("Menu") as? MenuViewController
    }
    
    class func centerViewController1() -> CenterViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("CenterViewController") as? CenterViewController
    }
}
