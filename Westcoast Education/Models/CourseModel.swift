//
//  CategoryModel.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-01-30.
//

import Foundation

struct Course: Hashable{
    var courseName: String;
    var subInfo: String
    var courseDetails: [CourseDetail]

    
    init(courseName: String, subInfo: String, courseDetails: [CourseDetail]) {
        self.courseName = courseName
        self.subInfo = subInfo
        self.courseDetails = courseDetails
    }
}
