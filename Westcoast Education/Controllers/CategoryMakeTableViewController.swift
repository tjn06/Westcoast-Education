//
//  CategoryMakeTableViewController.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-01-27.
//

// Controller, sitter mellan presentationen/vyer och modell

import UIKit

class CategoryMakeTableViewController: UITableViewController {
    
    // Handeling dataSource, functioncall in property, waits for execution until it exists
    lazy var dataSource = setupDataSource()
    
    var categories: [Category] = [
        Category(category: "Angular", logoImage: "angular", courses: [
            Course(courseName: "Routing", subInfo: "Svårighet: medel", courseDetails:[
                CourseDetail(description: "In a single-page app, you change what the user sees by showing or hiding portions of the display that correspond to particular components, rather than going out to the server to get a new page.", courseHours: "6")
            ]),
            Course(courseName: "Forms", subInfo: "Svårighet: medel", courseDetails:[
                CourseDetail(description: "Handling user input with forms is the cornerstone of many common applications. Applications use forms to enable users to log in, to update a profile, to enter sensitive information, and to perform many other data-entry tasks.", courseHours: "4")
            ]),
        ]),
        
        Category(category: "Android", logoImage: "android", courses: [
            Course(courseName: "Intrduction", subInfo: "Svårgihet: lätt", courseDetails:[
                CourseDetail(description: "Running Our Own Hello World Application.", courseHours: "1")
            ]),
            Course(courseName: "Accessibility", subInfo: "Svårighet: svår", courseDetails:[
                CourseDetail(description: "Create your first Android project", courseHours: "5")
            ]),
        ]),
        
        Category(category: "CSS3", logoImage: "css", courses: [
            Course(courseName: "Crash Course", subInfo: "Svårighet: medel", courseDetails:[
                CourseDetail(description: "You will learn many aspects of styling web pages! You’ll be able to set up the correct file structure, edit text and colors, and create attractive layouts. ", courseHours: "5")
            ]),
            Course(courseName: "Flexbox", subInfo: "Svårighet: medel", courseDetails:[
                CourseDetail(description: "This complete guide explains everything about flexbox, focusing on all the different possible properties for the parent element (the flex container) and the child elements (the flex items).", courseHours: "7")
            ]),
        ]),
        
        Category(category: ".NET", logoImage: "dotnet", courses: [
            Course(courseName: "Crash Course", subInfo: "Svårighet: lätt", courseDetails:[
                CourseDetail(description: "NET is a developer platform with tools and libraries for building any type of app, including web, mobile, desktop, games, IoT, cloud, and microservices. ", courseHours: "12")
            ]),
            Course(courseName: "Architecture", subInfo: "Svårighet: svår", courseDetails:[
                CourseDetail(description: "Applications that span more than one machine require a deliberate and radically different design approach. In this course, you will learn about the key concepts in distributed systems. You will also learn how to build systems that are scalable, reliable, and secure.", courseHours: "7")
            ]),
        ]),
        
        Category(category: "HTML5", logoImage: "html", courses: [
            Course(courseName: "Introduction", subInfo: "Svårighet: lätt", courseDetails:[
                CourseDetail(description: "HTML is one of the core building blocks of the web, as it encapsulates the content on the websites you visit. However, despite its huge influence, very few people are actually aware of how it works.", courseHours: "6")
            ]),
            Course(courseName: "HTML document", subInfo: "Svårighet: lätt", courseDetails:[
                CourseDetail(description: "Create your first HTML document. This lecture will explain how HTML files work, and it’ll also give you a quick primer on the URL bar in the browser.", courseHours: "2")
            ]),
        ]),
        
        Category(category: "Photoshop", logoImage: "photoshop", courses: [
            Course(courseName: "Crash Course", subInfo: "Svårighet: medel", courseDetails:[
                CourseDetail(description: "Learn Photoshop Color Adjustment, Content Aware, Crop, Text Style, Shadow, Selection, Masking, Blur, Filter, Retouching", courseHours: "5")
            ]),
            Course(courseName: "Basics", subInfo: "Svårighet: lätt", courseDetails:[
                CourseDetail(description: "Learn the essential techniques for improving your workflow and creating better images", courseHours: "3")
            ]),
        ]),
        
        Category(category: "React", logoImage: "react", courses: [
            Course(courseName: "Getting Started", subInfo: "Svårighet: medel", courseDetails:[
                CourseDetail(description: "Learn the React way to build rich interactive UIs using both class and function components with React Hooks", courseHours: "3")
            ]),
            Course(courseName: "Redux", subInfo: "Svårighet: svår", courseDetails:[
                CourseDetail(description: "If you’re building React applications, you’re likely sharing some kind of data between React components. When the application scales and sharing that data gets more complex, it’s time to use a state-management library.", courseHours: "8")
            ]),
        ]),
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Init tableViewDataSource
        
        // Connect dataSource to tableView
        tableView.dataSource = dataSource
        
        // Produced data in dataSource to screen
        var snapshot = NSDiffableDataSourceSnapshot<Section, Category>()
        
        snapshot.appendSections([.all]) // Define sections in snapshot
        snapshot.appendItems(categories, toSection: .all) // What data in which sections
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    // Creates a datasource, fully constructed inside setupDataSource func, instans, recommended for performance
    func setupDataSource() -> CategoryDiffableDataSource{
        let cellIdentifier = "makeCategoryBaseCell"
        
        // Create instance with closure, class with constructor
        let dataSource = CategoryDiffableDataSource(tableView: tableView, cellProvider: {
            
            tableView,
            indexPath,
            category in let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MakeCategoryTableViewCell
            
            cell.makeCategoryLabel.text = category.category
            cell.categoryImage.image = UIImage(named: category.categoryLogo)
            cell.nrOfCourses.text = "Tillgängliga kurser \(category.nrOfCourses) st"
            
            return cell
        })
        return dataSource
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "CoursesForMake"{
            if let indexPath = tableView.indexPathForSelectedRow {
            let destinationController = segue.destination as! MakeCourseViewController
                
                //destinationController.makeCourse = categories[indexPath.row]
                let ch = categories[indexPath.row]
                destinationController.courses = ch.courses
                destinationController.category = ch
            }
        }
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
    header.backgroundColor = .systemGray
    return header
}

override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 100
}
*/
