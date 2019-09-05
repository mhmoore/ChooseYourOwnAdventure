//
//  ScenarioController.swift
//  ChooseYourOwnAdventure
//
//  Created by Michael Moore on 9/4/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import Foundation

//  ScenarioController.swift
//  ChooseYourOwnAdventure
//
//  Created by Ian Hall on 9/4/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//
//hey hey hey
import Foundation
class ScenarioController{
    //singleTon
    static let shared = ScenarioController()
    //source of truth
    var scenarioDictionary: [Int:Scenario] = [:]
    //loadData
    func retrieveData(){
        let dictionaryOfScenarios = createScenarios()
        scenarioDictionary = dictionaryOfScenarios
    }
    //returns the next question
    func returnNextQuestion(with answerID: Int) -> Scenario?{
        guard let nextScenario = scenarioDictionary[answerID] else {return nil}
        return nextScenario
    }
    func createScenarios() -> [Int:Scenario]{
        //MARK: - Scenario00
        let scenario00Text = """
        as the moonlight sat shown through the trees and the slow draft of wind carries through the night you feel a sense of bewilderment around you.  Its Late....maybe to late but an exact hour is not made known to you.  trees surround you on all sides and directly in front of you stands a house.  the house isnt nesecarily unkempt or nesecarily eerie but it does stand empty...what will you do?
        """
        let scenario00 = Scenario(text: scenario00Text)
        //scenario 00 Responses
        let response1of00 = Response(identifier: -11, text: "enter the house")
        let response2of00 = Response(identifier: 11, text: "turn around surely there is a better story elsewhere")
        scenario00.responses.append(response1of00)
        scenario00.responses.append(response2of00)
        //MARK: - scenario 11 player chooses to enter home
        let scenario11Text = """
        you approach the home and open the front door.  as you step into the door you can hear the sound of....well that cant be right.  it sounds as if a large tiger was prancing around downstairs in the basement.  in front of you exists a staircase down the stairs.
        """
        let scenario11 = Scenario(text: scenario11Text)
        let response1of11 = Response(identifier: 22, text: "i mean whats the likelihood of a tiger being in a house? i should ckeck it out")
        let response2of11 = Response(identifier: 21, text: "are you kidding i aint brave im going to stay on this floor")
        //MARK: - scenario -11 player doesnt enter home
        let scenarioNeg11Text = """
        wow what a relief you turn your back on that house never to see it again!!  you follow the
        """
        let scenarioNeg11 = Scenario(text: "oogah boogah")
        return [00:scenario00,11:scenario11,-11: scenarioNeg11]
    }
}
