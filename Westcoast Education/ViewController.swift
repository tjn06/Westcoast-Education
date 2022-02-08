//
//  ViewController.swift
//  Westcoast Education
//
//  Created by Tobias Johnsson on 2022-01-26.
//

import UIKit

class ViewController: UIViewController {

    
    //@IBOutlet var infoBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }

    @IBAction func infoOnClick(_ sender: UIButton) {
        
        let info = UIAlertController(title: "App created by", message: "Tobias Johnsson", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "STÄNG", style: .default, handler: nil)
        
        info.addAction(cancelAction)
        
        present(info, animated: true, completion: nil)
    }
    
}

