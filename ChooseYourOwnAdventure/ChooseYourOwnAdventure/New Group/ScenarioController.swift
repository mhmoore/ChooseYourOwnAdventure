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
        as the moonlight cast itself through the trees, and the slow draft of wind carries through the night, you feel a sense of bewilderment around you.  Its Late....then again who knows what late really is? your sense of time seems to fail you. Trees surround you on all sides and directly in front of you stands an older home.  The house isnt nesecarily unkempt or nesecarily eerie but it does stand empty. but it feels as if its full of adventure..what will you do?
        """
        let scenario00 = Scenario(text: scenario00Text)
        //scenario 00 Responses
        let response1of00 = Response(identifier: 11, text: "Enter the house i mean obviously the narrator is pushing me in that direction.")
        let response2of00 = Response(identifier: -11, text: "turn around surely there is a better story elsewhere")
        scenario00.responses.append(response1of00)
        scenario00.responses.append(response2of00)
        
        //MARK: - scenario 11 player chooses to enter home
        let scenario11Text = """
        You approach the home and open the front door. reaching forward and grasping the door knob you push forward as a cool breeze leaves the home. As you step into the door you can hear a mysterious sound.  paper crumbling? no.  thats far to light of a noise.  this noise was deeper like the sound of....well that cant be right.  It sounds as if almost one would imagine a large tiger  prancing around downstairs in the basement on a pile of cereal.  in front of you exists a staircase down the dark staircase.
        """
        let scenario11 = Scenario(text: scenario11Text)
        let response1of11 = Response(identifier: 22, text: "i mean whats the likelihood of a tiger being in a house? i should ckeck it out")
        let response2of11 = Response(identifier: 21, text: "are you kidding im not brave im going to stay on this floor")
        
        scenario11.responses.append(response1of11)
        scenario11.responses.append(response2of11)
        
        
        //MARK: - scenario 21 stay on this floor
        
        let scenario21Text = "OH MY GOODNESS STOP BEING A PANSY BY TRYING TO DERAIL THE STORY IM THE NARRATOR AND I DECIDE WHAT HAPPENS NOW GO DOWN THE STAIRS.  YOU HIT THE LETS GO ON AN ADVENTURE BUTTON AND NOW HERE YOU ARE AVOIDING IT"
        
        let scenario21 = Scenario(text: scenario21Text)
        let response1of21 = Response(identifier: 22, text: "geez chillax man ill go down the stairs")
        let response2of21 = Response(identifier: 00, text: "nuh uh i QUIT")
        
        scenario21.responses = [response2of21, response1of21]
        
        //MARK: - Senario 22 descend the stairs
        
        let scenario22Text = """
you go down the stairs terror fills your heart and ...wait a second....the ground is covered in frosted flakes and look!! its tony the tiger! isnt he just great?? "quick theres no time to explain" said tony "we must go find azlan!!"  tony then drags you into a magical wardrobe (hey there can be more than one magical wardrobe in the universe) and when you walk out you find yourself on the planet of tatooine .....wow its hot but thankfully tony has a delicicious bowl of frosted flakes which you munch on enthusiastically (see arnt you glad you trusted me the narrator??) suddenly shots are fired towards your direction.  a bullet pierces your cereal bowl and milky goodness soaks in to the course sand.... Sand people on the horizon.  "quick now is the time for action" cried Tony.  he tosses you a blaster
"""
        let scenario22 = Scenario(text: scenario22Text)
        let scenario22Response1 = Response(identifier: 23, text: "fight them and stand your ground")
        let scenario22Response2 = Response(identifier: 24, text: "RUN FOR THE HILLS")
        scenario22.responses.append(scenario22Response1)
        scenario22.responses.append(scenario22Response2)
        let scenario23Text =      """
you fire your blaster and you and Tony hold your ground.  but the same people are to strong and the're closing in.  but then as you and Tony take cover.....Silence and then a Roar.
 over the hill a figure rises surrounding him are the remains of hundreds of sand people who no longer can walk single file....because they dont have legs.....anymore.....they also happen to be very dead... anyways its azlan!!! you and tony then hop on his back and using the power of narnia azlan activates his hyperdrive and you all blast off to nabuu...\n tony then goes on to explain a few things about you being the chosen one and how your going to go invade the sith super secret headquarters of evil on nabuu but it kinda goes in one ear and out the other because lets face it...your riding a magic lion....with a cartoon cereal mascot.....in space ... \n but you land in the middle of a fight and who do you see? none other than the coolest people ever and 2 dead people
like mace windu, morgan freeman(hes a jedi in the extended universe...i swear), a guy named jared who seems kinda fishey but hey who are you to judge, a jedi who looks really similar to peppa pig  and the most powerful jedi to ever exist Jedi Master Danny Devito \n  what youve never heard of him? well allow me to tell you ....\n \n  Legend tells of a legendary Jedi whose Jedi skills were the stuff of legend. He traveled the land in search of worthy foes.  He was so deadly in fact that his enemies would go blind from overexposure to pure awesomeness.Never before had a panda been so feared... and so loved.
"""
        let scenario23 = Scenario(text: scenario23Text)
        let response1of23 = Response(identifier: 31, text: "nice")
        let response2of23 = Response(identifier: 31, text: "thats cool but that jared guy seems sketchy")
        
        scenario23.responses = [response2of23, response1of23]
        
        //MARK: - RUN FOR THE HILLS SCENARIO 24
        
        
        let scenario24Text = """
you run and as you look back you witness the last few moments of Tonys life... but it doesnt affect you because your obviously heartless.  after a few hours of wandering through the desert you come across a cave. Tired from the heat of the day you settle in the cave and see a dark figure in a hood standing in front of you.  wordless he strikes you in the head
you awaken days later unsure of where you are anymore the walls are metallic almost space like and your rooms only feature is a singular door... \n spider man opens the door except this is no ordenary spider man...its spidermanus an evil sith lord!  he takes you and drags you out you sputter you cry begging for information....yet he says nothing.  he brings you to a large semicircular room.  multiple sith surround the table as well as several other evil people of evil proportions.  basically think of the worst person ever times it by 2 and then copy that evilness several times over and bam you have an inkling on how evil this room was... think like EA lootbox levels of evil here \n  bobba fet sat on the far right next to jabbu the hut.  in the center is a hooded figure and next to him the Captain of crunch himself with an two empty seats on his left side spider man took one of these and before you can mutter another word the door burst....and then in walked in a most peculiar man his name was JARED and while he may outwardly seem as a good guy he had just returned from his mission where he was a double agent *GASP* in his hand he held a canvas bag with something roughly the size of a bowling ball was inside "heres the head" said jared as he tossed the bag towards the center of the room "the head of Jedi knight Peppepis pig" he sat down in the final empty chair "where is Kylo" demanded the Captain " he died" replied jared "finishing off that poor excuse for a franchise Jedi youngling Harry Potter"\n now this is me the 4th wall breaking narator talking at this point...your probably wondering "is that the real Harry potter?" and the answer is yes..yes it is because Harry potter is lame but back to the story\n.  "well sucks to suck" said the Captain \n""
then finally the hooded figure spoke "pika pi.. pa pika pika pi"  "the darth lord would like to know if you would like to join the dark side"


"""
        
        let scenario24Response1 = Response(identifier: -32, text: "join the dark side")
        let scenario24Response2 = Response(identifier: -31, text: "OVER MY DEAD BODY")
        let scenario24 = Scenario(text: scenario24Text)
        scenario24.responses.append(scenario24Response1)
        scenario24.responses.append(scenario24Response2)
        
        //MARK: - scenario 31 jared goes on murder spree
        
        let scenario31Text = """
but before you could say anything jared murdered peppa pig....swiped her head clean off with a really cool lightsaber.  and then teleported to a mysterious location... "theres no time to lose we can think about how we lost peppa pig... i mean losting harry potter was okay because i mean is he really that important?"  said danny in the heat of the moment then danny hops on azlan with you and you ride into the fortress of evil.  faster than a speeding bullet our heros dash forward

"""
        let response31_1 = Response(identifier: 00, text: "send me back to the home screen please")
        let response31_2 = Response(identifier: 00, text: "dangit! well ill go look through the story options again")
        
        let scenario31 = Scenario(text: scenario31Text)
        scenario31.responses.append(response31_1)
        scenario31.responses.append(response31_2)
        //MARK: - scenario -11 player doesnt enter home
        let scenarioNeg11Text = """
        wow what a relief you turn your back on that house never to see it again!!  you follow the path for some time coming to a lake with a large colorful ship docked at the nearby pier.  a large deep voice grumbles with the sound of a thousand crunch berries bellows "ahoy there" well i guess the choice is yours
        """
        
        let response1ofneg11 = Response(identifier: -22, text: "Hello there")
        let response2ofneg11 = Response(identifier: -21, text: "hey look a aggresive shark with laser beams and a hunger for human flesh ill go swim maybe hes friendly")
        let scenarioNeg11 = Scenario(text:scenarioNeg11Text)
        scenarioNeg11.responses.append(response1ofneg11)
        scenarioNeg11.responses.append(response2ofneg11)
        
        
        //MARK: - scenario -21 player to swim DIES
        
        let scenarioTextneg23 = """
wow your stupid i mean really? you took a swim in shark infested waters?? and you expect this story to continue??? im a narator not God i cant save you from your own stupidity and clearly you couldnt either....
"""
        let responseNeg23_1 = Response(identifier: 00, text: "send me back to the home screen please")
        let responseNeg23_2 = Response(identifier: 00, text: "Game over to start again tap me")
        
        let scenarionNeg23 = Scenario(text: scenarioTextneg23)
        scenarionNeg23.responses.append(responseNeg23_1)
        scenarionNeg23.responses.append(responseNeg23_2)
        
        
        
        //MARK: - scenario -22 gonna go for a chat
        
        let scenarioNeg22Text = """
a dark hand reaches down and pulls you onto the ship he claims to be Captain Crunch and hes been looking for you claiming for you to be "the ugliest person" hes ever seen without another word from you he tosses you into the brig.  you awaken days later unsure of where you are anymore the walls are metallic almost space like and your rooms only feature is a singular door... \n spider man opens the door except this is no ordenary spider man...its spidermanus an evil sith lord!  he takes you and drags you out you sputter you cry begging for information....yet he says nothing.  he brings you to a large semicircular room.  multiple sith surround the table as well as several other evil people of evil proportions.  basically think of the worst person ever times it by 2 and then copy that evilness several times over and bam you have an inkling on how evil this room was... think like EA lootbox levels of evil here \n  bobba fet sat on the far right next to jabbu the hut.  in the center is a hooded figure and next to him the Captain of crunch himself with an two empty seats on his left side spider man took one of these and before you can mutter another word the door burst....and then in walked in a most peculiar man his name was JARED and while he may outwardly seem as a good guy he had just returned from his mission where he was a double agent *GASP* in his hand he held a canvas bag with something roughly the size of a bowling ball was inside "heres the head" said jared as he tossed the bag towards the center of the room "the head of Jedi knight Peppepis pig" he sat down in the final empty chair "where is Kylo" demanded the Captain " he died" replied jared "finishing off that poor excuse for a franchise Jedi youngling Harry Potter"\n now this is me the 4th wall breaking narator talking at this point...your probably wondering "is that the real Harry potter?" and the answer is yes..yes it is because Harry potter is lame but back to the story\n.  "well sucks to suck" said the Captain \n""
then finally the hooded figure spoke "pika pi.. pa pika pika pi"  "the darth lord would like to know if you would like to join the dark side"
"""
        let scenarioNeg22 = Scenario(text: scenarioNeg22Text)
        
        let responseNeg22_1 = Response(identifier: -32, text: "join the dark side")
        let responseNeg22_2 = Response(identifier: -31, text: "OVER MY DEAD BODY")
        
        scenarioNeg22.responses.append(responseNeg22_1)
        scenarioNeg22.responses.append(responseNeg22_2)
        
        
        
        //MARK: - Scenario -32 join the dark side
        
        let storyTextNeg32 = """
    well you gave into your rage and became a sith lord. and you know what the best part is?  you mad a pretty cool group of friends too! aparently the captain holds a weekly taco party at his place i mean yeah you put the force into a state of unbalance and thousands of families starve every day on multiple systems because of you...but hey your alive....right?
"""
        
        let responseNeg32_1 = Response(identifier: 00, text: "send me back to the home screen please")
        let responseNeg32_2 = Response(identifier: 00, text: "wait i feel guilty let me try again")
        
        let scenarioNeg32 = Scenario(text: storyTextNeg32)
        scenarioNeg32.responses.append(responseNeg32_1)
        scenarioNeg32.responses.append(responseNeg32_2)
        
        
        
        
        //MARK: - scenario -31 stand up for yourself
        let storyTextNeg31 = "immediately force lightning danced through the air and killed you and the last thing you here was crunchatize me captain"
        
        
        let responseNeg31_1 = Response(identifier: 00, text: "send me back to the home screen please")
        let responseNeg31_2 = Response(identifier: 00, text: "wait i feel guilty let me try again")
        
        let scenarioNeg31 = Scenario(text: storyTextNeg31)
        scenarioNeg31.responses.append(responseNeg31_1)
        scenarioNeg31.responses.append(responseNeg31_2)
        
        return [00:scenario00,11:scenario11,-11: scenarioNeg11, -21: scenarionNeg23, -22:scenarioNeg22, -32:scenarioNeg32, 21: scenario21,22:scenario22, 31: scenario31, -31: scenarioNeg31, 23: scenario23, 24: scenario24]
    }
}
