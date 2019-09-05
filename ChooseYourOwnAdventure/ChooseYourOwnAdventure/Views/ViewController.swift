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
    @IBOutlet weak var responseOneLabel: UILabel!
    @IBOutlet weak var responseTwoLabel: UILabel!
    
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
        navigationController?.popToRootViewController(animated: true)
        guard let scenario = ScenarioController.shared.returnNextQuestion(with: 00) else { return }
        updateViews(scenario: scenario, responseID: nil)
    }
    
    @IBAction func answerOneButtonTapped(_ sender: Any) {
        animateBlackView()
        guard let currentScenario = currentScenario else { return }
        selectedResponseID = currentScenario.responses[0].identifier
        grabNextScenario(selectedResponseID: selectedResponseID)
    }
    
    @IBAction func answerTwoButtonTapped(_ sender: Any) {
        animateBlackView()
        guard let currentScenario = currentScenario else { return }
        selectedResponseID = currentScenario.responses[1].identifier
        grabNextScenario(selectedResponseID: selectedResponseID)
    }
    
    // MARK: - Custom Methods
    func grabNextScenario(selectedResponseID: Int) {
        animateBlackView()
        guard let nextScenario = ScenarioController.shared.returnNextQuestion(with: selectedResponseID) else { return }
        currentScenario = nextScenario
        if let currentScenario = currentScenario {
            updateViews(scenario: currentScenario, responseID: selectedResponseID)
        }
    }
    
    func updateViews(scenario: Scenario, responseID: Int?) {
        if scenario.responses[0].identifier == 99 {
            navigationController?.popToRootViewController(animated: true)
//            scenarioTextView?.text = "You Die!!"
//            answerOneButton.setTitle("", for: .normal)
//            answerTwoButton.setTitle("", for: .normal)
        } else {
            guard let responseID = responseID else { return }
            if responseID < 0 {
                view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            } else {
                view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
            }
            scenarioTextView?.text = scenario.text
            responseOneLabel.text = scenario.responses[0].text
            responseTwoLabel.text = scenario.responses[1].text
        }
    }
    
    func setUpUI() {
        blackView.layer.cornerRadius = blackView.bounds.height / 2
        startOverButton.layer.cornerRadius = 10.0
        scenarioTextView.layer.borderWidth = 1.0
        scenarioTextView.layer.borderColor = UIColor.gray.cgColor
    }
    
    func animateBlackView() {
        UIView.animateKeyframes(withDuration: 0.4, delay: 0.0, options: [.autoreverse], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0, animations: {
                self.blackView.transform = CGAffineTransform(scaleX: 70.0, y: 70.0)
            })
            self.blackView.transform = .identity
            
        }, completion: nil)
    }
}



