//
//  MakeCourseViewController.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-02-01.
//

import UIKit

class MakeCourseViewController: UITableViewController {

    @IBOutlet var headerView: MakeCourseHeaderView!
    
    lazy var dataSource = setupDataSource()
    
    var category: Category?
    var courses: [Course]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.makeSelectedCategoryLabel.text = category?.category
        headerView.categorySelectedImage.image = UIImage(named: category!.categoryLogo)
        /*
        // If over 100 courses smaller fontsize to fit
        if ((category?.nrOfCourses)! > 100 ){
            headerView.nrOfCoursesSelectedCategory.font = headerView.nrOfCoursesSelectedCategory.font.withSize(40)
        }
        */
        headerView.nrOfCoursesSelectedCategory.text = "\(category?.nrOfCourses ?? 0)"
        
        
        tableView.dataSource = dataSource
        var snapshot = NSDiffableDataSourceSnapshot<Section, Course>()
        
        snapshot.appendSections([.all])
        snapshot.appendItems(courses!, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }
    
    func setupDataSource() -> UITableViewDiffableDataSource<Section, Course>{
        let cellIdentifier = "makeCourseCell"
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
                
                destinationController.category = category
                destinationController.course = courses![indexPath.row]
                
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
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
        
        let favouriteAction = UIContextualAction(style: .normal , title: "Extra"){
            (action, sourceView, completeHandler) in
            
            let cell = tableView.cellForRow(at: indexPath)
         
            if cell?.accessoryType == .checkmark {
                cell?.accessoryType = .none
            } else {
                cell?.accessoryType = .checkmark
            }
            
            completeHandler(true)
        }
     
        
        deleteAction.backgroundColor = UIColor.systemPink
        deleteAction.image = UIImage(systemName: "trash")

        
        var thumbImage = "hand.thumbsup"
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == .checkmark {
            thumbImage = "hand.thumbsdown"
            favouriteAction.backgroundColor = UIColor.systemYellow
        } else {
            thumbImage = "hand.thumbsup"
            favouriteAction.backgroundColor = UIColor.systemGreen
        }
        
        favouriteAction.image = UIImage(systemName: "\(thumbImage)")
        

        let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction, favouriteAction])
        return swipeConfig
    }
     
     

}
