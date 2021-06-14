//
//  ListQuestion.swift
//  GoJreng
//
//  Created by Dion Lamilga on 14/06/21.
//

import Foundation

class ListQuestion {
    var list = [Soal]()
    
    init() {
        list.append(Soal(song: "F", optionA: "C", optionB: "G", optionC: "B", optionD: "F", jawaban: 4))
        list.append(Soal(song: "G", optionA: "A", optionB: "F", optionC: "G", optionD: "C", jawaban: 3))
        list.append(Soal(song: "A", optionA: "C", optionB: "G", optionC: "B", optionD: "A", jawaban: 4))
        list.append(Soal(song: "D", optionA: "D", optionB: "A", optionC: "F", optionD: "C", jawaban: 1))
    }
}
