//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Glenn Cole on 5/23/20.
//  Copyright © 2020 Glenn Cole. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        playWithDynamicViews()
    }

    private func playWithDynamicViews() {
        
        let firstFrame = CGRect( x: 160, y: 240, width: 100, height: 150 )
        let firstView = UIView( frame: firstFrame )
        firstView.backgroundColor = .lightGray
        view.addSubview( firstView )
        
        let secondFrame = CGRect( x: 20, y: 30, width: 50, height: 50 )
        let secondView = UIView( frame: secondFrame )
        secondView.backgroundColor = .blue
        
        view.addSubview( secondView )  // views can have only one parent, so overridden!
        firstView.addSubview( secondView )
    }
}

