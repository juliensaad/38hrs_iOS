//
//  LocationListTableViewController.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-28.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class LocationListTableViewController: KingTableViewController {

    @IBOutlet weak var navItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navItem.leftBarButtonItem?.tintColor = darkGrayColor
        navItem.rightBarButtonItem?.tintColor = darkGrayColor
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.backgroundColor = UIColor.whiteColor()
        
        self.detectContentState()
    }
    
    override func updateUI() {
        tableView.reloadData()
    }
    
    @IBAction func didClickNavMenuButton(sender: AnyObject) {
        mainNavigationController.sideMenu?.showSideMenu()
    }
    
    @IBAction func didClickNavMapButton(sender: AnyObject) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: UITableViewDelegate
extension LocationListTableViewController: UITableViewDelegate{

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelSingleton.locations.count
    }
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath){
        
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
        var location = modelSingleton.locations[indexPath.item]
        
        var cell = LocationListItemTableViewCell()
        cell.awakeFromNib()
        
        cell.setName(location.name)
        cell.setCategorie(location.category.name)
        cell.locationImageButton.image = modelSingleton.getLocalImage()
        
        cell.nameLabel.tag = indexPath.item
        cell.nameLabel.addTarget(self, action: "didClickName:", forControlEvents: .TouchUpInside)
        
        return cell
    }
    
    func didClickName(sender : UIButton?){
        let locationViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LocationViewController") as LocationViewController
        
        var ind = sender!.tag
        locationViewController.location = modelSingleton.locations[ind]
        
        self.directNavigationController.pushViewController(locationViewController, animated: true)
    }
    
}