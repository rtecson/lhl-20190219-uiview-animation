//
//  Test2ViewController.swift
//  w6d2
//
//  Created by Roland on 2017-08-28.
//  Copyright © 2017 MoozX Internet Ventures. All rights reserved.
//

import UIKit

class Test2ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var boxViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var boxViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - IBActions
    @IBAction func testButtonTapped(_ sender: UIButton) {
        test1()
    }
}

// MARK: - UIViewController methods
extension Test2ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set initial values before animation
        boxViewLeadingConstraint.constant = 10
        boxViewHeightConstraint.constant = 100
        boxView.backgroundColor = UIColor.red
    }
}

// MARK: - Test methods
extension Test2ViewController {
    
    fileprivate func test1() {
        // Set desired values for after animation
        boxViewLeadingConstraint.constant = 200
        boxViewHeightConstraint.constant = 200
        
        UIView.animate(withDuration: 3, animations: { 
            // Animate layoutIfNeeded
            self.view.layoutIfNeeded()
        }) { (finished: Bool) in
            // Completion and cleanup
            self.boxView.backgroundColor = UIColor.blue
        }
    }
}
