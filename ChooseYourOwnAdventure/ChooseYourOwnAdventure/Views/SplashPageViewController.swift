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
        playButton.layer.cornerRadius = playButton.bounds.height / 4
        playButton.layer.borderColor = UIColor.lightGray.cgColor
        playButton.layer.borderWidth = 3.0
        playButton.layer.shadowRadius = 32.0
        playButton.layer.shadowColor = UIColor.black.cgColor
        playButton.layer.shadowOpacity = 1.0
        
        UIView.animate(withDuration: 2.5, delay: 0, options: [.curveEaseInOut , .allowUserInteraction, .autoreverse, .repeat], animations: {
            self.view.layer.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        }, completion: nil)
        UIView.animate(withDuration: 2.5, delay: 2.5, options: [.transitionCrossDissolve, .allowUserInteraction, .autoreverse, .repeat], animations: {
            self.view.layer.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }, completion: nil)
    }
}
