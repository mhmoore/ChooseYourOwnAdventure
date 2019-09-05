//
//  ViewController.swift
//  ChooseYourOwnAdventure
//
//  Created by Michael Moore on 9/4/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var scenarioLabel: UILabel!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var startOverButton: UIButton!
    
    // MARK: - Properties
    var selectedResponseID: Int = 00 // set to the response identifier which will equate to the id key for scenario dictionary
    var currentScenario: Scenario = {
        guard let scenario = ScenarioController.shared.returnNextQuestion(with: 00) else { return Scenario(text: "") }
        return scenario
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews(scenario: currentScenario)
    }
    
    // MARK: - Actions
    @IBAction func startOverButtonTapped(_ sender: Any) {
        guard let scenario = ScenarioController.shared.returnNextQuestion(with: 00) else { return }
            updateViews(scenario: scenario)
    }
    
    @IBAction func answerOneButtonTapped(_ sender: Any) {
        animateBlackView()
        selectedResponseID = currentScenario.responses[0].identifier
        guard let scenario = ScenarioController.shared.returnNextQuestion(with: selectedResponseID) else { return }
        updateViews(scenario: scenario)
    }
    @IBAction func answerTwoButtonTapped(_ sender: Any) {
        animateBlackView()
        selectedResponseID = currentScenario.responses[1].identifier
        guard let scenario = ScenarioController.shared.returnNextQuestion(with: selectedResponseID) else { return }
        updateViews(scenario: scenario)
    }
    @IBAction func answerThreeButtonTapped(_ sender: Any) {
        animateBlackView()
        selectedResponseID = currentScenario.responses[2].identifier
        guard let scenario = ScenarioController.shared.returnNextQuestion(with: selectedResponseID) else { return }
        updateViews(scenario: scenario)
    }
    @IBAction func answerFourButtonTapped(_ sender: Any) {
        animateBlackView()
        selectedResponseID = currentScenario.responses[3].identifier
        guard let scenario = ScenarioController.shared.returnNextQuestion(with: selectedResponseID) else { return }
        updateViews(scenario: scenario)
    }
    
    // MARK: - Custom Methods
    func updateViews(scenario: Scenario) {
            scenarioLabel?.text = scenario.text
            let responseCount = scenario.responses.count
        if responseCount == 4 {
            answerOneButton.setTitle(scenario.responses[0].text, for: .normal)
            answerTwoButton.setTitle(scenario.responses[1].text, for: .normal)
            answerThreeButton.setTitle(scenario.responses[2].text, for: .normal)
            answerFourButton.setTitle(scenario.responses[3].text, for: .normal)
        } else if responseCount == 3 {
            answerOneButton.setTitle(scenario.responses[0].text, for: .normal)
            answerTwoButton.setTitle(scenario.responses[1].text, for: .normal)
            answerThreeButton.setTitle(scenario.responses[2].text, for: .normal)
            answerFourButton.isHidden = true

        } else if responseCount == 2 {
            answerOneButton.setTitle(scenario.responses[0].text, for: .normal)
            answerTwoButton.setTitle(scenario.responses[1].text, for: .normal)
            answerThreeButton.isHidden = true
            answerFourButton.isHidden = true
        } else {
            answerOneButton.setTitle(scenario.responses[0].text, for: .normal)
            answerTwoButton.isHidden = true
            answerThreeButton.isHidden = true
            answerFourButton.isHidden = true
        }
    }
    
    func setUpUI() {
        answerOneButton.layer.borderWidth = 1.0
        answerOneButton.layer.borderColor = UIColor.gray.cgColor
        answerTwoButton.layer.borderWidth = 1.0
        answerTwoButton.layer.borderColor = UIColor.gray.cgColor
        answerThreeButton.layer.borderWidth = 1.0
        answerThreeButton.layer.borderColor = UIColor.gray.cgColor
        answerFourButton.layer.borderWidth = 1.0
        answerFourButton.layer.borderColor = UIColor.gray.cgColor
        blackView.layer.cornerRadius = blackView.bounds.height / 2
        startOverButton.layer.cornerRadius = 4.0
    }
    
    func animateBlackView() {
        UIView.animateKeyframes(withDuration: 2.0, delay: 0.1, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0, animations: {
                self.blackView.transform = CGAffineTransform(scaleX: 50.0, y: 50.0)
            })
        }, completion: nil)
    }
}



