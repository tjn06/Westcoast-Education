//
//  CategoryCourseModel.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-01-29.
//


// Pojo-class tillstånd
import Foundation

struct Category: Hashable {
    var category: String
    var categoryLogo: String
    var nrOfCourses: Int
    var courses: [Course]

    
    init(category: String, logoImage: String, courses: [Course]){
        self.category = category
        self.categoryLogo = logoImage
        self.nrOfCourses = courses.count
        self.courses = courses
    }
}
