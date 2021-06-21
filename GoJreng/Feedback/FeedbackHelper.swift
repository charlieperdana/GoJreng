//
//  FeedbackHelper.swift
//  GoJreng
//
//  Created by Angelica Janissia on 16/06/21.
//

import Foundation
import UIKit

class FeedbackHelper{
  
  static func highScoreChanger(stgScore: Int, curHighScore: Int)-> Int{
    if stgScore > curHighScore{
      return stgScore
    }else {
      return curHighScore
    }
  }

  static func getCurrentHighScore(stagePlayed: Int)-> Int{
    let defaults = UserDefaults.standard

    switch stagePlayed {
    case 1:
      return defaults.integer(forKey: "hS1")

    case 2:
      return defaults.integer(forKey: "hS2")

    case 3:
      return defaults.integer(forKey: "hS3")

    default:
      return 0
    }
  }

  static func saveHighScore(stagePlayed: Int, newHighScore: Int){
    let defaults = UserDefaults.standard
    
    switch stagePlayed {
    case 1:
      defaults.set(newHighScore, forKey: "hS1")
    case 2:
      defaults.set(newHighScore, forKey: "hS2")
    case 3:
      defaults.set(newHighScore, forKey: "hS3")
    default:
      break
    }
  }

  static func getFeedbackPage (curHighScore: Int, stgScore: Int, stagePlayed: Int) -> Int{

    if stgScore == 0{
      //feedback type 1 - GameOver
      return 1
    }
    else if stgScore > curHighScore{
      //feedback type 0 - Congrats
      return 0
    }
    else if stagePlayed == 2 || stagePlayed == 3 && stgScore == 1000{ //level done
      return 2
    }
    else{
      //feedback type 1 - GameOver
      return 1
    }
  }
}
