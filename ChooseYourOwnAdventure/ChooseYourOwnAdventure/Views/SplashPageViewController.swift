//
//  SplashPageViewController.swift
//  ChooseYourOwnAdventure
//
//  Created by Michael Moore on 9/4/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import UIKit

class SplashPageViewController: UIViewController {
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        playButton.layer.cornerRadius = playButton.bounds.height / 2
        playButton.layer.borderColor = UIColor.lightGray.cgColor
        playButton.layer.borderWidth = 5.0
        playButton.layer.shadowRadius = 32.0
        playButton.layer.shadowColor = UIColor.cyan.cgColor
        playButton.layer.shadowOpacity = 1.0
    }
}
