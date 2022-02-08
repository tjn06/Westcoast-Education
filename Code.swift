//
//  Code.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-01-28.
//

import UIKit

class Code: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


// ---------
/*
 //
 //  CategoryMakeTableViewController.swift
 //  Westcoast Education
 //
 //  Created by Tobias Johnsson on 2022-01-27.
 //

 import UIKit

 class CategoryMakeTableViewController: UITableViewController {
     
     
     var categories = ["Android", "Angular", "CSS3", ".NET", "HTML5", "Photoshop", "React"]
     var logos = ["android", "angular", "css", "dotnet", "html", "photoshop", "react"]
     
     override func viewDidLoad() {
         super.viewDidLoad()

     }

     
     override func numberOfSections(in tableView: UITableView) -> Int {
         // #warning Incomplete implementation, return the number of sections
         return 1
     }

     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of rows
         return categories.count
     }
     

     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         _ = "makeCategoryBaseCell"
         //let cellIdentifier = "makeCategoryBaseCell"
         
         let cell = tableView.dequeueReusableCell(withIdentifier: "makeCategoryBaseCell", for: indexPath) as! MakeCategoryTableViewCell
         
         cell.makeCategoryLabel.text = categories[indexPath.row]
         cell.categoryImage.image = UIImage(named: logos[indexPath.row])
         return cell
     }

     override var prefersStatusBarHidden: Bool{
         return true
     }

 }









 /*
 override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String {
     return "Kategorier"
 }

 override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
     header.backgroundColor = .systemGray5
     return header
 }

 override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     return 100
 }
 */

 
 
 
 */
