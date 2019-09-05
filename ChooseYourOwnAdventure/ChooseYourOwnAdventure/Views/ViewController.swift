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
    @IBOutlet weak var scenarioTextView: UITextView!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var startOverButton: UIButton!
    
    // MARK: - Properties
    var selectedResponseID: Int = 00 // set to the response identifier which will equate to the id key for scenario dictionary
    var currentScenario: Scenario?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ScenarioController.shared.retrieveData()
        guard let scenario = ScenarioController.shared.scenarioDictionary[0] else { return }
        currentScenario = scenario
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let currentScenario = currentScenario else { return }
        updateViews(scenario: currentScenario, responseID: selectedResponseID)
    }
    
    // MARK: - Actions
    @IBAction func startOverButtonTapped(_ sender: Any) {
        guard let scenario = ScenarioController.shared.returnNextQuestion(with: 00) else { return }
        updateViews(scenario: scenario, responseID: nil)
    }
    
    @IBAction func answerOneButtonTapped(_ sender: Any) {
        animateBlackView()
        guard let currentScenario = currentScenario else { return }
        selectedResponseID = currentScenario.responses[0].identifier
        guard let scenario = ScenarioController.shared.returnNextQuestion(with: selectedResponseID) else { return }
        updateViews(scenario: scenario, responseID: selectedResponseID)
    }
    
    @IBAction func answerTwoButtonTapped(_ sender: Any) {
        animateBlackView()
        guard let currentScenario = currentScenario else { return }
        selectedResponseID = currentScenario.responses[1].identifier
        guard let scenario = ScenarioController.shared.returnNextQuestion(with: selectedResponseID) else { return }
        updateViews(scenario: scenario, responseID: selectedResponseID)
    }
    
    // MARK: - Custom Methods
    func updateViews(scenario: Scenario, responseID: Int?) {
        if scenario.responses[0].identifier == 99 {
            navigationController?.popToRootViewController(animated: true)
            scenarioTextView?.text = ""
            answerOneButton.setTitle("", for: .normal)
            answerTwoButton.setTitle("", for: .normal)
        } else {
            guard let responseID = responseID else { return }
            if responseID < 0 {
                view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            } else {
                view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
            }
            scenarioTextView?.text = scenario.text
            answerOneButton.setTitle(scenario.responses[0].text, for: .normal)
            answerTwoButton.setTitle(scenario.responses[1].text, for: .normal)
        }
    }
    
    func setUpUI() {
        answerOneButton.layer.borderWidth = 1.0
        answerOneButton.layer.borderColor = UIColor.gray.cgColor
        answerTwoButton.layer.borderWidth = 1.0
        answerTwoButton.layer.borderColor = UIColor.gray.cgColor
        answerOneButton.titleLabel?.font = UIFont(name: "Palatino", size: 14.0)
        answerTwoButton.titleLabel?.font = UIFont(name: "Palatino", size: 14.0)
        blackView.layer.cornerRadius = blackView.bounds.height / 2
        startOverButton.layer.cornerRadius = 10.0
        scenarioTextView.layer.borderWidth = 1.0
        scenarioTextView.layer.borderColor = UIColor.gray.cgColor
    }
    
    func animateBlackView() {
        UIView.animateKeyframes(withDuration: 2.0, delay: 0.1, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0, animations: {
                self.blackView.transform = CGAffineTransform(scaleX: 50.0, y: 50.0)
            })
        }, completion: nil)
    }
}



