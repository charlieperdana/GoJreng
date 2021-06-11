//
//  StagesData.swift
//  GoJreng
//
//  Created by Novi Gunawan on 10/06/21.
//

import Foundation

//var stage1 = Stages(stageName: "Major/Minor Identification", stageState: .unlocked, question: questionsForStage1, questionNumber: 24)
//var stage2 = Stages(stageName: "Chord Identification", stageState: .locked, question: questionsForStage2, questionNumber: 10)
//var stage3 = Stages(stageName: "Chord Progression Identification", stageState: .locked, question: questionsForStage3, questionNumber: 10)

var stage1 = Stages(stageName: "Major/Minor Identification", stageState: .unlocked, questionNumber: 24)
var stage2 = Stages(stageName: "Chord Identification", stageState: .locked, questionNumber: 10)
var stage3 = Stages(stageName: "Chord Progression Identification", stageState: .locked, questionNumber: 10)

func setUpQuestionsStage() {
    //Append questions for stage 1
    for i in 0..<(stage1.questionNumber/2) {
        majorQuestionsAnswers.append("major-\(i)")
        minorQuestionsAnswers.append("minor-\(i)")
    }
    
    //Append questions for stage 2 and stage 3 starting from 2 chords played.
    for i in 0..<(stage2.questionNumber) {
        chord2Progressions.append("chord2-\(i)")
        chord3Progressions.append("chord3-\(i)")
        chord4Progressions.append("chord4-\(i)")
    }
}

var majorQuestionsAnswers: [String] = []
var minorQuestionsAnswers: [String] = []
var chord2Progressions: [String] = []
var chord3Progressions: [String] = []
var chord4Progressions: [String] = []

var questionsForStage1 = [
    
    Questions(questionSound: "\(majorQuestionsAnswers[0])", answer: [
        Answers(answerLabel: "Major", isCorrect: true),
        Answers(answerLabel: "Minor", isCorrect: false)
        
    ]),
    
    Questions(questionSound: "\(minorQuestionsAnswers[11])", answer: [
        Answers(answerLabel: "Major", isCorrect: false),
        Answers(answerLabel: "Minor", isCorrect: true)
    ]),
    
    Questions(questionSound: "\(majorQuestionsAnswers[1])", answer: [
        Answers(answerLabel: "Major", isCorrect: true),
        Answers(answerLabel: "Minor", isCorrect: false)
        
    ]),
    
    Questions(questionSound: "\(minorQuestionsAnswers[10])", answer: [
        Answers(answerLabel: "Major", isCorrect: false),
        Answers(answerLabel: "Minor", isCorrect: true)
    ]),
    
    Questions(questionSound: "\(minorQuestionsAnswers[9])", answer: [
        Answers(answerLabel: "Major", isCorrect: false),
        Answers(answerLabel: "Minor", isCorrect: true)
    ]),
    
    Questions(questionSound: "\(majorQuestionsAnswers[2])", answer: [
        Answers(answerLabel: "Major", isCorrect: true),
        Answers(answerLabel: "Minor", isCorrect: false)
        
    ]),
    
    Questions(questionSound: "\(minorQuestionsAnswers[8])", answer: [
        Answers(answerLabel: "Major", isCorrect: false),
        Answers(answerLabel: "Minor", isCorrect: true)
    ]),
    
    Questions(questionSound: "\(majorQuestionsAnswers[3])", answer: [
        Answers(answerLabel: "Major", isCorrect: true),
        Answers(answerLabel: "Minor", isCorrect: false)
        
    ]),
    
    Questions(questionSound: "\(minorQuestionsAnswers[7])", answer: [
        Answers(answerLabel: "Major", isCorrect: false),
        Answers(answerLabel: "Minor", isCorrect: true)
    ]),
    
    Questions(questionSound: "\(majorQuestionsAnswers[4])", answer: [
        Answers(answerLabel: "Major", isCorrect: true),
        Answers(answerLabel: "Minor", isCorrect: false)
        
    ]),
    
    Questions(questionSound: "\(minorQuestionsAnswers[6])", answer: [
        Answers(answerLabel: "Major", isCorrect: false),
        Answers(answerLabel: "Minor", isCorrect: true)
    ]),
    
    Questions(questionSound: "\(minorQuestionsAnswers[5])", answer: [
        Answers(answerLabel: "Major", isCorrect: false),
        Answers(answerLabel: "Minor", isCorrect: true)
    ]),
    
    Questions(questionSound: "\(majorQuestionsAnswers[6])", answer: [
        Answers(answerLabel: "Major", isCorrect: true),
        Answers(answerLabel: "Minor", isCorrect: false)
        
    ]),
    
    Questions(questionSound: "\(majorQuestionsAnswers[5])", answer: [
        Answers(answerLabel: "Major", isCorrect: true),
        Answers(answerLabel: "Minor", isCorrect: false)
        
    ]),
    
    Questions(questionSound: "\(majorQuestionsAnswers[7])", answer: [
        Answers(answerLabel: "Major", isCorrect: true),
        Answers(answerLabel: "Minor", isCorrect: false)
        
    ]),
    
    Questions(questionSound: "\(minorQuestionsAnswers[4])", answer: [
        Answers(answerLabel: "Major", isCorrect: false),
        Answers(answerLabel: "Minor", isCorrect: true)
    ]),
    
    
    Questions(questionSound: "\(minorQuestionsAnswers[3])", answer: [
        Answers(answerLabel: "Major", isCorrect: false),
        Answers(answerLabel: "Minor", isCorrect: true)
    ]),
    
    Questions(questionSound: "\(majorQuestionsAnswers[8])", answer: [
        Answers(answerLabel: "Major", isCorrect: true),
        Answers(answerLabel: "Minor", isCorrect: false)
        
    ]),
    
    Questions(questionSound: "\(minorQuestionsAnswers[2])", answer: [
        Answers(answerLabel: "Major", isCorrect: false),
        Answers(answerLabel: "Minor", isCorrect: true)
    ]),
    
    Questions(questionSound: "\(majorQuestionsAnswers[9])", answer: [
        Answers(answerLabel: "Major", isCorrect: true),
        Answers(answerLabel: "Minor", isCorrect: false)
        
    ]),
    
    Questions(questionSound: "\(minorQuestionsAnswers[1])", answer: [
        Answers(answerLabel: "Major", isCorrect: false),
        Answers(answerLabel: "Minor", isCorrect: true)
    ]),
    
    Questions(questionSound: "\(minorQuestionsAnswers[0])", answer: [
        Answers(answerLabel: "Major", isCorrect: false),
        Answers(answerLabel: "Minor", isCorrect: true)
    ]),
    
    Questions(questionSound: "\(majorQuestionsAnswers[11])", answer: [
        Answers(answerLabel: "Major", isCorrect: true),
        Answers(answerLabel: "Minor", isCorrect: false)
        
    ]),
    
    Questions(questionSound: "\(majorQuestionsAnswers[10])", answer: [
        Answers(answerLabel: "Major", isCorrect: true),
        Answers(answerLabel: "Minor", isCorrect: false)
        
    ]),
]

var questionsForStage2 = [
    //1 chord
    
    //C
    Questions(questionSound: "\(majorQuestionsAnswers[3])", answer: [
        Answers(answerSound: "\(majorQuestionsAnswers[3])", answerLabel: "C", isCorrect: true),
        Answers(answerSound: "\(majorQuestionsAnswers[8])", answerLabel: "F", isCorrect: false),
        Answers(answerSound: "\(majorQuestionsAnswers[10])", answerLabel: "G", isCorrect: false),
        Answers(answerSound: "\(minorQuestionsAnswers[1])", answerLabel: "Am", isCorrect: false),
        
    ]),
    
    //Am
    Questions(questionSound: "\(minorQuestionsAnswers[1])", answer: [
        Answers(answerSound: "\(majorQuestionsAnswers[8])", answerLabel: "F", isCorrect: false),
        Answers(answerSound: "\(majorQuestionsAnswers[10])", answerLabel: "G", isCorrect: false),
        Answers(answerSound: "\(majorQuestionsAnswers[3])", answerLabel: "C", isCorrect: false),
        Answers(answerSound: "\(minorQuestionsAnswers[1])", answerLabel: "Am", isCorrect: true),
        
    ]),
    
    //Dm
    Questions(questionSound: "\(minorQuestionsAnswers[6])", answer: [
        Answers(answerSound: "\(majorQuestionsAnswers[10])", answerLabel: "G", isCorrect: false),
        Answers(answerSound: "\(majorQuestionsAnswers[8])", answerLabel: "F", isCorrect: false),
        Answers(answerSound: "\(minorQuestionsAnswers[6])", answerLabel: "Dm", isCorrect: true),
        Answers(answerSound: "\(minorQuestionsAnswers[5])", answerLabel: "D#m", isCorrect: false)
        
        
    ]),
    
    //G
    Questions(questionSound: "\(majorQuestionsAnswers[10])", answer: [
        Answers(answerSound: "\(minorQuestionsAnswers[7])", answerLabel: "Em", isCorrect: false),
        Answers(answerSound: "\(majorQuestionsAnswers[10])", answerLabel: "G", isCorrect: true),
        Answers(answerSound: "\(minorQuestionsAnswers[11])", answerLabel: "Gm", isCorrect: false),
        Answers(answerSound: "\(majorQuestionsAnswers[11])", answerLabel: "G#", isCorrect: false),
        
    ]),
    
    //2 chord
    
    //C-Am
    Questions(questionSound: "\(chord2Progressions[1])", answer: [
        Answers(answerSound: "\(chord2Progressions[3])", answerLabel: "D-Bm", isCorrect: false),
        Answers(answerSound: "\(chord2Progressions[7])", answerLabel: "F-G", isCorrect: false),
        Answers(answerSound: "\(chord2Progressions[5])", answerLabel: "Dm-G", isCorrect: false),
        Answers(answerSound: "\(chord2Progressions[1])", answerLabel: "C-Am", isCorrect: true),
        
    ]),
    
    //Dm-G
    Questions(questionSound: "\(chord2Progressions[5])", answer: [
        Answers(answerSound: "\(chord2Progressions[4])", answerLabel: "D-G", isCorrect: false),
        Answers(answerSound: "\(chord2Progressions[5])", answerLabel: "Dm-G", isCorrect: true),
        Answers(answerSound: "\(chord2Progressions[8])", answerLabel: "G-A", isCorrect: false),
        Answers(answerSound: "\(chord2Progressions[9])", answerLabel: "G-C", isCorrect: false),
        
    ]),
    
    //G-C
    Questions(questionSound: "\(chord2Progressions[9])", answer: [
        Answers(answerSound: "\(chord2Progressions[2])", answerLabel: "C-F", isCorrect: false),
        Answers(answerSound: "\(chord2Progressions[6])", answerLabel: "Em-A", isCorrect: false),
        Answers(answerSound: "\(chord2Progressions[9])", answerLabel: "G-C", isCorrect: true),
        Answers(answerSound: "\(chord2Progressions[0])", answerLabel: "A-D", isCorrect: false),
        
    ]),
    
    //3 chord
    
    //C-Am-Dm
    Questions(questionSound: "\(chord3Progressions[1])", answer: [
        Answers(answerSound: "\(chord3Progressions[2])", answerLabel: "C-F-G", isCorrect: false),
        Answers(answerSound: "\(chord3Progressions[1])", answerLabel: "C-Am-Dm", isCorrect: true),
        Answers(answerSound: "\(chord3Progressions[0])", answerLabel: "A-D-E", isCorrect: false),
        Answers(answerSound: "\(chord3Progressions[9])", answerLabel: "G-Em-Am", isCorrect: false),
        
    ]),
    
    //C-F-G
    Questions(questionSound: "\(chord3Progressions[2])", answer: [
        Answers(answerSound: "\(chord3Progressions[2])", answerLabel: "C-F-G", isCorrect: true),
        Answers(answerSound: "\(chord3Progressions[3])", answerLabel: "D-Bm-Em", isCorrect: false),
        Answers(answerSound: "\(chord3Progressions[6])", answerLabel: "E-A-B", isCorrect: false),
        Answers(answerSound: "\(chord3Progressions[7])", answerLabel: "E-C#m-F#m", isCorrect: false),
        
    ]),
    //Dm-G-C
    Questions(questionSound: "\(chord3Progressions[5])", answer: [
        Answers(answerSound: "\(chord3Progressions[4])", answerLabel: "D-G-A", isCorrect: false),
        Answers(answerSound: "\(chord3Progressions[8])", answerLabel: "G-C-D", isCorrect: false),
        Answers(answerSound: "\(chord3Progressions[6])", answerLabel: "E-A-B", isCorrect: false),
        Answers(answerSound: "\(chord3Progressions[5])", answerLabel: "Dm-G-C", isCorrect: true),
        
    ]),
]

var questionsForStage3 = [
    
    // MARK: -HARUS DIOPTIMIZE LAGI STRUCTURENYA
    //TODO
        // Harus dioptimize lagi STRUCTURENYA!
    
    //2 chord
    
    //C-Am
    Questions(questionSound: "\(chord2Progressions[1])", answer: [
        //Pilihan
        Answers(answerLabel: "C", isCorrect: false),
        Answers(answerLabel: "Am", isCorrect: false),
        
        //Jawaban
        Answers(answerLabel: "C-Am", isCorrect: true)
    ]),
    
    
    //Dm-G
    Questions(questionSound: "\(chord2Progressions[5])", answer: [
        //Pilihan
        Answers(answerLabel: "Dm", isCorrect: false),
        Answers(answerLabel: "G", isCorrect: false),
        
        //Jawaban
        Answers(answerLabel: "Dm-G", isCorrect: true)
    ]),
    

    //F-G
    Questions(questionSound: "\(chord2Progressions[7])", answer: [
        //Pilihan
        Answers(answerLabel: "F", isCorrect: false),
        Answers(answerLabel: "G", isCorrect: false),
        
        //Jawaban
        Answers(answerLabel: "F-G", isCorrect: true),
    ]),
    
    //D-G
    Questions(questionSound: "\(chord2Progressions[4])", answer: [
        //Pilihan
        Answers(answerLabel: "D", isCorrect: false),
        Answers(answerLabel: "G", isCorrect: false),
        
        //Jawaban
        Answers(answerLabel: "D-G", isCorrect: true),
    ]),
    
    //3 Chord
    
    //C-Am-Dm
    Questions(questionSound: "\(chord3Progressions[1])", answer: [
        //Pilihan
        Answers(answerLabel: "C", isCorrect: false),
        Answers(answerLabel: "Am", isCorrect: false),
        Answers(answerLabel: "Dm", isCorrect: false),
        
        //Jawaban
        Answers(answerLabel: "C-Am-Dm", isCorrect: true),
    ]),
    
    //C-F-G
    Questions(questionSound: "\(chord3Progressions[1])", answer: [
        //Pilihan
        Answers(answerLabel: "C", isCorrect: false),
        Answers(answerLabel: "F", isCorrect: false),
        Answers(answerLabel: "G", isCorrect: false),
        
        //Jawaban
        Answers(answerLabel: "C-F-G", isCorrect: true),
    ]),
    
    //G-C-D
    Questions(questionSound: "\(chord3Progressions[8])", answer: [
        //Pilihan
        Answers(answerLabel: "G", isCorrect: false),
        Answers(answerLabel: "C", isCorrect: false),
        Answers(answerLabel: "D", isCorrect: false),

        //Jawaban
        
        Answers(answerLabel: "G-C-D", isCorrect: true),
    ]),
    
    //4 Chord
    
    //C-Am-Dm-G
    Questions(questionSound: "\(chord4Progressions[1])", answer: [
        //Pilihan
        Answers(answerLabel: "C", isCorrect: false),
        Answers(answerLabel: "Am", isCorrect: false),
        Answers(answerLabel: "Dm", isCorrect: false),
        Answers(answerLabel: "G", isCorrect: false),
        //Jawaban
        
        Answers(answerLabel: "C-Am-Dm-G", isCorrect: true),
    ]),
    
    //C-F-Am-G
    Questions(questionSound: "\(chord4Progressions[2])", answer: [
        //Pilihan
        Answers(answerLabel: "C", isCorrect: false),
        Answers(answerLabel: "F", isCorrect: false),
        Answers(answerLabel: "Am", isCorrect: false),
        Answers(answerLabel: "G", isCorrect: false),
        
        //Jawaban
        Answers(answerLabel: "C-F-Am-G", isCorrect: true),
    ]),
    
    //C-G-C-F
    Questions(questionSound: "\(chord4Progressions[3])", answer: [
        //Pilihan
        Answers(answerLabel: "C", isCorrect: false),
        Answers(answerLabel: "G", isCorrect: false),
        Answers(answerLabel: "C", isCorrect: false),
        Answers(answerLabel: "F", isCorrect: false),
        //Jawaban
        
        Answers(answerLabel: "C-G-C-F", isCorrect: true),
    ]),
]
