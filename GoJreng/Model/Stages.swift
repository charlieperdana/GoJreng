//
//  Stages.swift
//  GoJreng
//
//  Created by Novi Gunawan on 08/06/21.
//

import Foundation
import UIKit

enum StageState {
    case locked
    case unlocked
    
    func getIcon() -> UIImage {
        switch self {
        case .locked:
            return #imageLiteral(resourceName: "lock")
            
        case .unlocked:
            return #imageLiteral(resourceName: "playButton")
        }
    }
    
    func getBackground() -> UIImage {
        switch self {
        case .locked:
            return #imageLiteral(resourceName: "bg-0")
            
        case .unlocked:
            return #imageLiteral(resourceName: "bg-1")
        }
    }
    
    func getRowHeight() -> Int {
        switch self {
        case .locked:
            return 84
            
        case .unlocked:
            return 145
        }
    }

}

class Stages {
    let id: String = UUID().uuidString
    var stageName: String
    var stageState: StageState?
    var question: [Questions]
    var highScore: Int
    init(stageName: String, stageState: StageState?, question: [Questions]) {
        self.stageName = stageName
        self.stageState = stageState
        self.question = question
    }
}

var stage1 = Stages(stageName: "Major Minor Identification", stageState: .unlocked, question: questionsForStage1)

var questionsForStage1 = [
    
    Questions(questionSound: <#T##String#>, answer: [
        Answers(answerSound: <#T##String#>, isCorrect: true),
        Answers(answerSound: <#T##String#>, isCorrect: false),
        Answers(answerSound: <#T##String#>, isCorrect: false),
        Answers(answerSound: <#T##String#>, isCorrect: false)
        
    ]),
    
    Questions(questionSound: <#T##String#>, answer: [
        Answers(answerSound: <#T##String#>, isCorrect: false),
        Answers(answerSound: <#T##String#>, isCorrect: true),
        Answers(answerSound: <#T##String#>, isCorrect: false),
        Answers(answerSound: <#T##String#>, isCorrect: false)
    ]),
    
    Questions(questionSound: <#T##String#>, answer: [
        Answers(answerSound: <#T##String#>, isCorrect: false),
        Answers(answerSound: <#T##String#>, isCorrect: false),
        Answers(answerSound: <#T##String#>, isCorrect: false),
        Answers(answerSound: <#T##String#>, isCorrect: true)
    ]),
    
    Questions(questionSound: <#T##String#>, answer: [
        Answers(answerSound: <#T##String#>, isCorrect: false),
        Answers(answerSound: <#T##String#>, isCorrect: false),
        Answers(answerSound: <#T##String#>, isCorrect: true),
        Answers(answerSound: <#T##String#>, isCorrect: false)
    ]),
    
    Questions(questionSound: <#T##String#>, answer: [
        Answers(answerSound: <#T##String#>, isCorrect: false),
        Answers(answerSound: <#T##String#>, isCorrect: true),
        Answers(answerSound: <#T##String#>, isCorrect: false),
        Answers(answerSound: <#T##String#>, isCorrect: false)
    ]),

    Questions(questionSound: <#T##String#>, answer: [
        Answers(answerSound: <#T##String#>, isCorrect: false),
        Answers(answerSound: <#T##String#>, isCorrect: false),
        Answers(answerSound: <#T##String#>, isCorrect: <#T##Bool#>),
        Answers(answerSound: <#T##String#>, isCorrect: true)
    ]),
    
    Questions(questionSound: <#T##String#>, answer: [
        Answers(answerSound: <#T##String#>, isCorrect: true),
        Answers(answerSound: <#T##String#>, isCorrect: <#T##Bool#>),
        Answers(answerSound: <#T##String#>, isCorrect: <#T##Bool#>),
        Answers(answerSound: <#T##String#>, isCorrect: <#T##Bool#>)
    ]),
    
    Questions(questionSound: <#T##String#>, answer: [
        Answers(answerSound: <#T##String#>, isCorrect: <#T##Bool#>),
        Answers(answerSound: <#T##String#>, isCorrect: true),
        Answers(answerSound: <#T##String#>, isCorrect: <#T##Bool#>),
        Answers(answerSound: <#T##String#>, isCorrect: <#T##Bool#>)
    ]),
    
    Questions(questionSound: <#T##String#>, answer: [
        Answers(answerSound: <#T##String#>, isCorrect: true),
        Answers(answerSound: <#T##String#>, isCorrect: <#T##Bool#>),
        Answers(answerSound: <#T##String#>, isCorrect: <#T##Bool#>),
        Answers(answerSound: <#T##String#>, isCorrect: <#T##Bool#>)
    ]),
    
    Questions(questionSound: <#T##String#>, answer: [
        Answers(answerSound: <#T##String#>, isCorrect: <#T##Bool#>),
        Answers(answerSound: <#T##String#>, isCorrect: <#T##Bool#>),
        Answers(answerSound: <#T##String#>, isCorrect: <#T##Bool#>),
        Answers(answerSound: <#T##String#>, isCorrect: true)
    ]),
]


