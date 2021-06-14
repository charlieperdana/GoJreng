//
//  Question.swift
//  GoJreng
//
//  Created by Dion Lamilga on 14/06/21.
//

import Foundation
import UIKit

class Soal{
    let song: String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    let jawaban: Int
    
    init(song: String, optionA: String, optionB: String, optionC: String, optionD: String, jawaban: Int) {
        self.song = song
        self.optionA = optionA
        self.optionB = optionB
        self.optionC = optionC
        self.optionD = optionD
        self.jawaban = jawaban
    }
}
