//
//  FeedbackHelper.swift
//  GoJreng
//
//  Created by Angelica Janissia on 16/06/21.
//

import Foundation

class FeedbackHelper{
  static func getFeedbackPage (curHighScore: Int, stgScore: Int) -> Int{

    if curHighScore == 0{
      //feedback type 1 - GameOver
      return 1
    }
    else if curHighScore < stgScore {
      //feedback type 0 - Congrats
      return 0
    }

    else{
      //feedback type 1 - GameOver
      return 1
    }
  }
}
