//
//  PageHelper.swift
//  GoJreng
//
//  Created by Angelica Janissia on 16/06/21.
//

import Foundation
import UIKit



class PageHelper{
  static func highScoreChanger(stgScore: Int, curHighScore: Int)-> Int{
    if stgScore > curHighScore{
      return stgScore
    }else {
      return curHighScore
    }
  }

  static func showHomePage(newHighS: Int, currentStoryBoard: UIViewController){
    let modalStoryBoard = UIStoryboard(name: "HomeP", bundle: nil)
    let vc = modalStoryBoard.instantiateViewController(identifier: "HomeView") as! HomePageViewController

    vc.newHighScore = newHighS

    vc.modalPresentationStyle = .overFullScreen
    vc.modalTransitionStyle = .flipHorizontal
    currentStoryBoard.present(vc, animated: true)
  }

  static func showStage1(currentStoryBoard: UIViewController){
    let storyBoard = UIStoryboard(name: "Mode1Board", bundle: nil)
    let vc = storyBoard.instantiateViewController(identifier: "mode1") as! Mode1ViewController


    vc.modalPresentationStyle = .overFullScreen
    vc.modalTransitionStyle = .flipHorizontal
    currentStoryBoard.present(vc, animated: true)
  }

  static func showStage2(newHighScore: Int, currentStoryBoard: UIViewController){
    let modalstoryboard = UIStoryboard(name: "SecondStage", bundle: nil)
    let vc = modalstoryboard.instantiateViewController(identifier: "secondStage") as! SecondStageViewController

    vc.highScore = newHighScore

    vc.modalPresentationStyle = .overFullScreen
    vc.modalTransitionStyle = .flipHorizontal
    currentStoryBoard.present(vc, animated: true)
  }

  static func showStage3(){
    
  }

  static func showFeedback(stgPlayed: Int, stgScore: Int, curHighScore: Int, currentStoryBoard: UIViewController){
    let storyBoard = UIStoryboard(name: "FeedbackPage", bundle: nil)
    let vc = storyBoard.instantiateViewController(identifier: "feedbackPage") as! FeedbackPageViewController

    vc.stagePlayed = stgPlayed
    vc.stageScore = stgScore
    vc.currentHighScore = curHighScore

    vc.modalPresentationStyle = .overFullScreen
    vc.modalTransitionStyle = .flipHorizontal
    currentStoryBoard.present(vc, animated: true)
  }

}

