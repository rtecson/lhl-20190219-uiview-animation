//
//  Test1ViewController.swift
//  w6d2
//
//  Created by Roland on 2017-08-28.
//  Copyright © 2017 MoozX Internet Ventures. All rights reserved.
//

import UIKit

class Test1ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var boxView: UIView!
    
    // MARK: - IBActions
    @IBAction func testButtonTapped(_ sender: UIButton) {
        test4()
    }
}

// MARK: - Test methods
extension Test1ViewController {

    // Test simple UIView animation
    fileprivate func test1() {
        // Set initial values before animation
        boxView.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        boxView.backgroundColor = UIColor.red
        
        // Calculate end X coordinate
        let viewWidth = view.bounds.width
        let endX = viewWidth - 100 - 10
        
        UIView.animate(withDuration: 3, animations: {
            // Values for end state of animation
            self.boxView.frame = CGRect(x: endX, y: self.boxView.frame.minY, width: self.boxView.frame.width, height: self.boxView.frame.height)
        }) { (finished: Bool) in
            // Completion and cleanup
            self.boxView.backgroundColor = UIColor.blue
        }
    }
    
    // Test UIView animation with additional parameters
    fileprivate func test2() {
        // Set initial values before animation
        boxView.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        boxView.backgroundColor = UIColor.red
        
        // Calculate end X coordinate
        let viewWidth = view.bounds.width
        let endX = viewWidth - 100 - 10

        // Change delay and options to try different animation options (.curveLinear,
        // .curveEaseIn, .curveEaseOut, curveEaseInOut, .repeat, .autoReverse)
        UIView.animate(withDuration: 3, delay: 2, options: .curveLinear, animations: {
            // Values for end state of animation
            self.boxView.frame = CGRect(x: endX, y: self.boxView.frame.minY, width: self.boxView.frame.width, height: self.boxView.frame.height)
        }) { (finished: Bool) in
            // Completion and cleanup
            self.boxView.backgroundColor = UIColor.blue
        }
    }
    
    // Test UIView spring animation
    fileprivate func test3() {
        // Set initial values before animation
        boxView.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        boxView.backgroundColor = UIColor.red
        
        // Calculate end X coordinate
        let viewWidth = view.bounds.width
        let endX = viewWidth - 100 - 10

        UIView.animate(withDuration: 8, delay: 0, usingSpringWithDamping: 0.25, initialSpringVelocity: 5, options: [], animations: {
            // Values for end state of animation
            self.boxView.frame = CGRect(x: endX, y: self.boxView.frame.minY, width: self.boxView.frame.width, height: self.boxView.frame.height)
        }) { (finished: Bool) in
            // Completion and cleanup
            self.boxView.backgroundColor = UIColor.blue
        }
    }
    
    // Test UIView keyframe animations
    fileprivate func test4() {
        // Set initial values before animation
        boxView.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        boxView.backgroundColor = UIColor.red
        boxView.alpha = 1.0
        
        // Calculate end X coordinate
        let viewWidth = view.bounds.width
        let endX = viewWidth - 100 - 10
        
        UIView.animateKeyframes(withDuration: 6.0, delay: 0.0, options: [], animations: {
            // Setup keyframes
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                // Values for first intermediate state
                let x = endX * 0.75
                self.boxView.frame = CGRect(x: x, y: self.boxView.frame.minY, width: self.boxView.frame.width, height: self.boxView.frame.height)
                self.boxView.alpha = 0.5
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                // Values for next intermediate state
                let x = endX * 0.25
                self.boxView.frame = CGRect(x: x, y: self.boxView.frame.minY, width: self.boxView.frame.width, height: self.boxView.frame.height)
                self.boxView.alpha = 0.75
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                // Values for next intermediate state
                let x = endX * 0.5
                self.boxView.frame = CGRect(x: x, y: self.boxView.frame.minY, width: self.boxView.frame.width, height: self.boxView.frame.height)
                self.boxView.alpha = 0.0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                // Values for end state (last intermediate state)
                let x = endX
                self.boxView.frame = CGRect(x: x, y: self.boxView.frame.minY, width: self.boxView.frame.width, height: self.boxView.frame.height)
                self.boxView.alpha = 1.0
            })
        }) { (finished: Bool) in
            // Completion and cleanup
            self.boxView.backgroundColor = UIColor.blue
        }
    }
}
