//
//  ViewController.swift
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

private let kTableHeaderHeight: CGFloat = 300.0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var datasourceArr: [NewsItem] = []
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBOutlet weak var dateLabel: UILabel!
    var headerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0.0, bottom: 0.0, right: 0.0)
        tableView.contentOffset = CGPoint(x: 0.0, y: -kTableHeaderHeight)
        updateHeaderView()
        
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
        tableView.delegate = self
        tableView.dataSource = self
        let dateFormatter:DateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "MMMM d"
        let today:Date = Date()
        
        dateLabel.text = dateFormatter.string(from: today)
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        headerView.frame = headerRect
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    
    
    

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datasourceArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
        
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


}

