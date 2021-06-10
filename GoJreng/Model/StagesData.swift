//
//  StagesData.swift
//  GoJreng
//
//  Created by Novi Gunawan on 10/06/21.
//

import Foundation

var stage1 = Stages(stageName: "Major/Minor Identification", stageState: .unlocked,  questionNumber: 24)

var majorQuestions: [String] = []
var minorQuestions: [String] = []

//for i in 0..<(stage1.questionNumber/2) {
//    majorQuestions.append("major-\(i)")
//    minorQuestions.append("minor-\(i)")
//}
//print("berhasil diprint")



//var questionsForStage1 = [
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: true),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false)
//    ]),
//
//    Questions(questionSound: <#T##String#>, answer: [
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: false),
//        Answers(answerSound: <#T##String#>, isCorrect: true)
//    ])
//]

