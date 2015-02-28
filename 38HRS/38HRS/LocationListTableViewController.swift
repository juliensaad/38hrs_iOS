//
//  LocationListTableViewController.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-28.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class LocationListTableViewController: UITableViewController {

    private var mainNavigationController : MainNavigationController!
    @IBOutlet weak var navItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.extendedLayoutIncludesOpaqueBars = true
        mainNavigationController = (self.navigationController as MainNavigationController)
        
        navItem.leftBarButtonItem?.tintColor = darkGrayColor
        navItem.rightBarButtonItem?.tintColor = darkGrayColor
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didClickNavMenuButton(sender: AnyObject) {
        mainNavigationController.sideMenu?.showSideMenu()
    }
    
    @IBAction func didClickNavMapButton(sender: AnyObject) {
        
    }

}

// MARK: UITableViewDelegate
extension LocationListTableViewController: UITableViewDelegate{

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath){
        let locationViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LocationViewController") as LocationViewController
        self.navigationController?.pushViewController(locationViewController, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        var tempCell = LocationListItemTableViewCell()
        tempCell.awakeFromNib()
        return tempCell.getCellHeight()
    }
}

// MARK: UITableViewDataSource
extension LocationListTableViewController: UITableViewDataSource{
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = LocationListItemTableViewCell()
        cell.awakeFromNib()
        return cell
    }
    
}