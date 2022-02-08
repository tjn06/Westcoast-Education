//
//  CourseDiffableDataSource.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-01-30.
//

import UIKit


class CourseDiffableDataSource: UITableViewDiffableDataSource<Section, Course> {
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
