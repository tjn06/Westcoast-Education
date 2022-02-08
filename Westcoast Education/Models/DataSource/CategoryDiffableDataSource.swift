//
//  CategoryDiffableDataSource.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-01-29.
//

import UIKit

enum Section{
    case all
}

class CategoryDiffableDataSource: UITableViewDiffableDataSource<Section, Category> {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
