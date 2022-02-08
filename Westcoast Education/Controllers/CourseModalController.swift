//
//  CourseModalController.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-02-07.
//

import UIKit

class CourseModalController: UIViewController {

    var course: Course?
    
    @IBOutlet var courseLabel: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet var comment: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        courseLabel.text = "\(course?.courseName ?? "")"
    }
    
    @IBAction func sendCommentInputs(_ sender: UIButton) {
        let commentInputs = CommentInputs(name: name.text!, comment: comment.text!)
        print(commentInputs)
    }
    
}
