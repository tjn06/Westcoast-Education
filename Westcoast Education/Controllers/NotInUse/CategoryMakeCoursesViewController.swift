//
//  CategoryMakeCoursesViewController.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-01-29.
//

import UIKit

class CategoryMakeCoursesViewController: UIViewController{ //}, UITableViewDataSource, UITableViewDelegate {

    //@IBOutlet var makeCourseLabel: UILabel!
    //@IBOutlet var categoryImage: UIImageView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: MakeCourseHeaderView!
    
    lazy var dataSource = setupDataSource()
    
    var categories: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.makeSelectedCategoryLabel.text = categories?.category
        headerView.categorySelectedImage.image = UIImage(named: categories!.categoryLogo)
        headerView.nrOfCoursesSelectedCategory.text = "\(categories?.nrOfCourses ?? 0)"
        
        tableView.dataSource = dataSource
        var snapshot = NSDiffableDataSourceSnapshot<Section, Course>()
        
        snapshot.appendSections([.all])
        snapshot.appendItems(categories!.courses, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }
    
    func setupDataSource() -> UITableViewDiffableDataSource<Section, Course>{
        let cellIdentifier = "makeCustomCourseCell"
        let dataSource = CourseDiffableDataSource(tableView: tableView, cellProvider: {
            
            tableView,
            indexPath,
            course in let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MakeCourseTableViewCell
            
            cell.courseName?.text = course.courseName
            cell.subHeader?.text = course.subInfo
            
            return cell
        })
        
        
        return dataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "ShowCourseDetailsSegue"){
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! CourseMakeDetailsViewController
                
                destinationController.course = categories?.courses[indexPath.row]
                
            }
        }
    }
    
   /*
    func tableView(_ tableView: UITableView, trailingSwipeActionConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let courses = self.dataSource.itemIdentifier(for: indexPath) else {
            UISwipeActionsConfiguration()
        }
        
    }
    */
    
    /*
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let course = self.dataSource.itemIdentifier(for: indexPath) else {
            return UISwipeActionsConfiguration()
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Ta bort"){
            (action, sourceView, completeHandler) in
            
            var snapshot = self.dataSource.snapshot()
            snapshot.deleteItems([course])
            
            self.dataSource.apply(snapshot, animatingDifferences: true)
            
            completeHandler(true)
        }
        
        let anotherAction = UIContextualAction(style: .normal, title: "Extra"){
            (action, sourceView, completeHandler) in
            
            completeHandler(true)
        }
     
        
            
        deleteAction.backgroundColor = UIColor.systemMint
        deleteAction.backgroundColor = UIColor.systemBlue
        deleteAction.image = UIImage(systemName: "trash")
        anotherAction.image = UIImage(systemName: "heart")
     
        let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction, anotherAction])
        return swipeConfig
    }
     
     */
    
    
    

     
    
}












/*
 //
 //  CategoryMakeCoursesViewController.swift
 //  Westcoast Education
 //
 //  Created by Tobias Johnsson on 2022-01-29.
 //

 import UIKit

 class CategoryMakeCoursesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

     

     //@IBOutlet var makeCourseLabel: UILabel!
     //@IBOutlet var categoryImage: UIImageView!
     @IBOutlet var tableView: UITableView!
     @IBOutlet var headerView: MakeCourseHeaderView!
     
     var categories: Category?
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         print(categories!)

         headerView.makeSelectedCategoryLabel.text = categories?.category
         headerView.categorySelectedImage.image = UIImage(named: categories!.categoryLogo)
         headerView.nrOfCoursesSelectedCategory.text = "\(categories?.nrOfCourses ?? 0)"
     
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return categories?.courses.count ?? 0
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cellIdentifier = "courseCell"
         let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
         
         cell.textLabel?.text = "Kurs \(categories?.courses[indexPath.row].courseName ?? "")"
         cell.detailTextLabel?.text = "\(categories?.courses[indexPath.row].subInfo ?? "")"
         
         return cell
     }



 }

 */
