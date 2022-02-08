//
//  MakeCourseDescriptionCell.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-02-06.
//

import UIKit

class MakeCourseDescriptionCell: UITableViewCell {

    
    @IBOutlet var courseDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
