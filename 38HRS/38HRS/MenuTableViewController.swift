//
//  MenuViewController.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-26.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit


class MenuTableViewController: UITableViewController {

    private var headerHeight : CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.allowsSelection = false
        self.tableView.backgroundColor = UIColor.whiteColor()
        
        // Do any additional setup after loading the view.
        
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
            return 4
        default:
            return 0
        }
    }
}

// MARK: UITableViewDataSource
extension MenuTableViewController: UITableViewDataSource{
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        var label = UILabel(frame: CGRectMake(contentMargin+5, 0, 0, 0))
        label.font = UIFont(name: "FuturaStd-Bold", size: 17)
        
        var switchView = SwitchView()
        switchView.drawRect(CGRectMake(0, 0, 0, 0))
        switchView.frame.origin.x = tableView.frame.size.width - switchView.frame.width - contentMargin
        switchView.center.y = cell.frame.height/2
        cell.addSubview(switchView)
        
        switch (indexPath.item) {
        case 0:
            label.text = "Culture"
        case 1:
            label.text = "Food"
            switchView.setActive(true)
        case 2:
            label.text = "Nightlife"
            switchView.setActive(true)
        case 3:
            label.text = "Shopping"
        default:
            label.text = ""
        }
        
        label.sizeToFit()
        label.center.y = cell.frame.height/2
        cell.addSubview(label)
        return cell
        
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = UIButton(frame: CGRectMake(0, 0, tableView.frame.size.width, headerHeight))
        
        var label = UILabel(frame: CGRectMake(contentMargin, 0, 0, 0))
        label.font = UIFont(name: "FuturaStd-Bold", size: 22)
        
        var arrowImage = UIImage(named: "right_arrow")
        var arrowView = UIImageView()
        arrowView.image = arrowImage
        arrowView.sizeToFit()
        arrowView.frame.origin.x = tableView.frame.size.width - arrowView.frame.width - contentMargin
        arrowView.center.y = headerHeight/2
        
        switch (section) {
        case 0:
            label.text = "FILTERS"
        case 1:
            label.text = "CITIES"
            headerCell.addSubview(arrowView)
        case 2:
            label.text = "ABOUT US"
            headerCell.addSubview(arrowView)
        default:
            label.text = ""
        }
        
        label.sizeToFit()
        label.center.y = headerHeight/2
        headerCell.addSubview(label)
        
        return headerCell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
}
