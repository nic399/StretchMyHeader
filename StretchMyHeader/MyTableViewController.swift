//
//  MyTableViewController.swift
//  StretchMyHeader
//
//  Created by Nicholas Fung on 2017-11-07.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

import UIKit
struct NewsItem {
    var storyCategory:Categories
    var headline:String
    init(storyCategory: Categories, headline: String) {
        self.storyCategory = storyCategory
        self.headline = headline
    }
}

enum Categories:String {
    case World = "World", Europe = "Europe", MiddleEast = "Middle East", Africa = "Africa", AsiaPacific = "Asia Pacific", Americas = "Americas"
}

class MyTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var datasourceArr: [NewsItem] = []
    override var prefersStatusBarHidden: Bool {
        return true
    }

    
    // MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        datasourceArr += [NewsItem.init(storyCategory: Categories.World, headline: "Climate change protests, divestments meet fossil fuels realities")]
        datasourceArr += [NewsItem.init(storyCategory: Categories.Europe, headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'")]
        datasourceArr += [NewsItem.init(storyCategory: Categories.MiddleEast, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible")]
        datasourceArr += [NewsItem.init(storyCategory: Categories.Africa, headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim")]
        datasourceArr += [NewsItem.init(storyCategory: Categories.AsiaPacific, headline: "Despite UN ruling, Japan seeks backing for whale hunting")]
        datasourceArr += [NewsItem.init(storyCategory: Categories.Americas, headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")]
        datasourceArr += [NewsItem.init(storyCategory: Categories.World, headline: "South Africa in $40 billion deal for Russian nuclear reactors")]
        datasourceArr += [NewsItem.init(storyCategory: Categories.Europe, headline: "'One million babies' created by EU student exchanges")]

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40.0
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datasourceArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CustomTableViewCell
        
        let cellData = datasourceArr[indexPath.row]
        
        cell.categoryLabel.text = cellData.storyCategory.rawValue
        cell.categoryLabel.textColor = categoryTextColor(forCategory: cellData.storyCategory)
        cell.headlineLabel.text = cellData.headline

        
        return cell
    }
    
    func categoryTextColor(forCategory:Categories) -> UIColor {
        switch forCategory {
        case .World:
            return UIColor.red
        case .Europe:
            return UIColor.green
        case .MiddleEast:
            return UIColor.yellow
        case .Africa:
            return UIColor.orange
        case .AsiaPacific:
            return UIColor.purple
        case .Americas:
            return UIColor.blue
        }
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
