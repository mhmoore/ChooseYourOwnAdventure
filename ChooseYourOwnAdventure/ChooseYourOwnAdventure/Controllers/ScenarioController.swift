//
//  ScenarioController.swift
//  ChooseYourOwnAdventure
//
//  Created by Ian Hall on 9/4/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import Foundation

class ScenarioController{
    
    //singleTon
    static let shared = ScenarioController()
    
    //source of truth
    var scenarioDictionary: [Int:Scenario] = [:]
    
    //loadData
    func retrieveData(){
        
    }
    //returns the next question
    func returnNextQuestion(with answerID: Int) -> Scenario?{
        return nil
            }
    
    //returns the start of the story
    func returnStoryStart() -> Scenario?{
        return nil
    }
}
