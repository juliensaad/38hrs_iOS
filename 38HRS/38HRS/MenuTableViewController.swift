//
//  MenuViewController.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-26.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit


class MenuTableViewController: KingTableViewController {

    private var headerHeight : CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.backgroundColor = UIColor.whiteColor()
        
        self.detectContentState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: UITableViewDelegate
extension MenuTableViewController: UITableViewDelegate{
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return modelSingleton.categories.count
        default:
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath){
        (tableView.cellForRowAtIndexPath(indexPath) as SwitchTableViewCell).toggleSwitch()
    }
}

// MARK: UITableViewDataSource
extension MenuTableViewController: UITableViewDataSource{
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = SwitchTableViewCell()
        cell.awakeFromNib()
        
        cell.setTitle(modelSingleton.categories[indexPath.item].name)
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = MenuHeaderButton(frame: CGRectMake(0, 0, tableView.frame.size.width, headerHeight))
        headerCell.drawRect(headerCell.frame)
        
        switch (section) {
        case 0:
            headerCell.setHeaderTitle("FILTERS")
            headerCell.setHeaderIdentifier(.Filters)
        case 1:
            headerCell.setHeaderTitle("CITIES")
            headerCell.setHeaderIdentifier(.Cities)
        case 2:
            headerCell.setHeaderTitle("ABOUT US")
            headerCell.setHeaderIdentifier(.About)
        default:
            headerCell.setHeaderTitle("")
        }
        
        headerCell.addTarget(self, action: "didClickHeader:", forControlEvents: .TouchUpInside)
        
        return headerCell
    }
    
    func didClickHeader(sender: UIButton!){
        var headerButton = sender as MenuHeaderButton
        
        //TODO: create pages and implement right actions
        switch(headerButton.identifier){
        case .Cities:
            println("Open city page")
        case .About:
            println("Open about page")
        default:
            println("nothing")
        }
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
}
