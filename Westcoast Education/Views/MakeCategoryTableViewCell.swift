//
//  MakeCategoryTableViewCell.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-01-27.
//

// Detta är en vy
import UIKit

class MakeCategoryTableViewCell: UITableViewCell {

    
    @IBOutlet var makeCategoryLabel: UILabel!
    @IBOutlet var categoryImage: UIImageView!
    @IBOutlet var nrOfCourses: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
