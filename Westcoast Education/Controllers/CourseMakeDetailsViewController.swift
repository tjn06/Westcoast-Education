//
//  CourseMakeDetailsViewController.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-01-31.
//

import UIKit

class CourseMakeDetailsViewController: UIViewController {
    
    @IBOutlet var courseTableView: UITableView!
    @IBOutlet var headerDetailView: MakeHeaderDetailView!
    @IBOutlet var recivedCommentName: UILabel!
    @IBOutlet var recivedComment: UILabel!
  
    lazy var dataSource = setupDataSource()
    
    var category: Category!
    var course: Course?
    //var commentInputs: CommentInputs!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerDetailView.makeSelectedCategoryLabel.text = course?.courseName
        headerDetailView.categorySelectedImage.image = UIImage(named: category!.categoryLogo)
        headerDetailView.nrOfHoursSelectedCategory.text = course?.courseDetails[0].courseHours
        
        
        
        
         
        
        courseTableView.dataSource = dataSource
        var snapshot = NSDiffableDataSourceSnapshot<Section, CourseDetail>()
        
        snapshot.appendSections([.all])
        snapshot.appendItems(course!.courseDetails, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)


    }
    
    func setupDataSource() -> UITableViewDiffableDataSource<Section, CourseDetail>{
        let cellIdentifier = "courseDescriptionCell"
        let dataSource = CourseDetailsDiffableDataSource(tableView: courseTableView, cellProvider: {
            
            tableView,
            indexPath,
            courseDetails in let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for : indexPath) as! MakeCourseDescriptionCell
            
            cell.courseDescription?.text = courseDetails.description
            
            return cell
        })
        
        return dataSource
        
    }

    @IBAction func closeCourseModal(segue: UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func getCommentInputsFromModal(segue: UIStoryboardSegue){
        if let sourceController = segue.source as? CourseModalController{
            recivedComment.text = sourceController.comment.text ?? ""
            recivedCommentName.text = "Namn: \(sourceController.name.text ?? "")"
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "showCommentSegue") {
            let courseCommentController = segue.destination as! CourseModalController
            courseCommentController.course = course
        }
    }

}
