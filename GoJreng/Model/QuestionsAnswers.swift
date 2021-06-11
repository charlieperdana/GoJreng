//
//  Questions.swift
//  GoJreng
//
//  Created by Novi Gunawan on 08/06/21.
//

import Foundation
import UIKit

struct Questions {
    var questionSound: String
    var answer: [Answers]
}

struct Answers {
    var answerSound: String?
    var answerLabel: String
    var isCorrect: Bool?
}
