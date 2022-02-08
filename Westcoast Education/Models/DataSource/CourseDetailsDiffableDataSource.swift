//
//  CourseDetailsDiffableDataSource.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-01-31.
//

import UIKit

class CourseDetailsDiffableDataSource: UITableViewDiffableDataSource<Section, CourseDetail> {
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
