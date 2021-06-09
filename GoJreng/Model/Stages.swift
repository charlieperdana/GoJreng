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
    
    init(stageName: String, stageState: StageState?, question: [Questions]) {
        self.stageName = stageName
        self.stageState = stageState
        self.question = question
    }
}
