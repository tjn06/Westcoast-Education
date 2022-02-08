//
//  MakeCourseTableViewCell.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-01-30.
//

import UIKit

class MakeCourseTableViewCell: UITableViewCell {
    
    @IBOutlet var courseName: UILabel!
    @IBOutlet var subHeader: UILabel!
     
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
