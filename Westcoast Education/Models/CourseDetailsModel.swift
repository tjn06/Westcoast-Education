//
//  CourseDetailsModel.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-01-31.
//

import Foundation

struct CourseDetail: Hashable {
    var description: String
    var courseHours: String
    
    init(description: String, courseHours: String){
        self.description = description
        self.courseHours = courseHours
    }
}
