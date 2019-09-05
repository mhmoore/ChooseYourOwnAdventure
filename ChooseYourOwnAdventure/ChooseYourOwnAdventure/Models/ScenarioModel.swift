//
//  ScenarioModel.swift
//  ChooseYourOwnAdventure
//
//  Created by Ian Hall on 9/4/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import Foundation

struct Keys {
    static let storyTextInitializerKey = "Text"
    
    static let storyResponsesInitializerKey = "Response"
    
    static let responseIdentifierKey = "ID"
    
    static let responseTextKey = "ResponseText"
}

class Scenario{
    
    let text:String
    
    let responses:[Response]
    
    init?(storyDictionary:[String:Any]) {
        //create a temporary storage solution
        var responsesTemp:[Response] = []
        //pull my text from the storydictionary
        guard let text = storyDictionary[Keys.storyTextInitializerKey] as? String else {return nil}
        //attempt to grab the responses from the dictionary
        if  let responseDictionaries = storyDictionary[Keys.storyResponsesInitializerKey] as? [[String:Any]] {
            //loop through the responses (responses will be saved as a dictionary)
            for dictionary in responseDictionaries{
                //pull out the ID
                guard let id = dictionary[Keys.responseIdentifierKey] as? Int else {return nil}
                //pull out the text
                guard let responseText = dictionary[Keys.responseTextKey] as? String else {return nil}
                //create an instance
                let newResponse = Response(identifier: id, text: responseText)
                //add to temporary storage
                responsesTemp.append(newResponse)
            }
            
        }
        self.text = text
        self.responses = responsesTemp
    }
}

class Response{
    
    let text:String
    
    let identifier:Int
    
    init(identifier:Int, text: String){
        self.text = text
        self.identifier = identifier
    }
}
