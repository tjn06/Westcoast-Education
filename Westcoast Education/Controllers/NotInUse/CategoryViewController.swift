//
//  CategoryViewController.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-01-26.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var categories = ["Android", "Angular", "CSS3", ".NET", "HTML5", "Photoshop", "React"]
    var logos = ["android", "angular", "css", "dotnet", "html", "photoshop", "react"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "makeCategoryCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MakeCategoryTableViewCell
        
        cell.makeCategoryLabel.text = categories[indexPath.row]
        cell.categoryImage.image  = UIImage(named: logos[indexPath.row])
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    

}


