//
//  PageHelper.swift
//  GoJreng
//
//  Created by Angelica Janissia on 16/06/21.
//

import Foundation
import UIKit



class PageHelper{
  static func showHomePage(currentStoryBoard: UIViewController){
//    let modalStoryBoard = UIStoryboard(name: "HomeP", bundle: nil)
//    let vc = modalStoryBoard.instantiateViewController(identifier: "HomeView") as! HomePageViewController
//
//    vc.modalPresentationStyle = .overFullScreen
//    vc.modalTransitionStyle = .flipHorizontal
//    currentStoryBoard.present(vc, animated: true)
    
    currentStoryBoard.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
  }

  static func showStage1(currentStoryBoard: UIViewController){
    let storyBoard = UIStoryboard(name: "Mode1Board", bundle: nil)
    let vc = storyBoard.instantiateViewController(identifier: "firstStage") as! Mode1ViewController

    vc.modalPresentationStyle = .overFullScreen
    vc.modalTransitionStyle = .flipHorizontal
    currentStoryBoard.present(vc, animated: true)
  }

  static func showStage2(currentStoryBoard: UIViewController){
    let modalstoryboard = UIStoryboard(name: "SecondStage", bundle: nil)
    let vc = modalstoryboard.instantiateViewController(identifier: "secondStage") as! SecondStageViewController

    vc.modalPresentationStyle = .overFullScreen
    vc.modalTransitionStyle = .flipHorizontal
    currentStoryBoard.present(vc, animated: true)
    
  }

  static func showStage3(currentStoryBoard: UIViewController){
    let modalstoryboard = UIStoryboard(name: "Stage3", bundle: nil)
    let vc = modalstoryboard.instantiateViewController(identifier: "Stage3") as! Stage3ViewController
    
    vc.modalPresentationStyle = .overFullScreen
    vc.modalTransitionStyle = .flipHorizontal
    currentStoryBoard.present(vc, animated: true)
    
  }

  static func showFeedback(stgPlayed: Int, stgScore: Int, currentStoryBoard: UIViewController){
    let storyBoard = UIStoryboard(name: "FeedbackPage", bundle: nil)
    let vc = storyBoard.instantiateViewController(identifier: "feedbackPage") as! FeedbackPageViewController

    vc.stagePlayed = stgPlayed
    vc.stageScore = stgScore

    vc.modalPresentationStyle = .overFullScreen
    vc.modalTransitionStyle = .flipHorizontal
    currentStoryBoard.present(vc, animated: true)
  }

  static func showExitModal(stgPlayed: Int, currentStoryBoard: UIViewController){
    let modalStoryBoard = UIStoryboard(name: "ExitMenuStoryboard", bundle: nil)
    let vc = modalStoryBoard.instantiateViewController(identifier: "exitModal") as! ExitMenuViewController

    vc.stage = stgPlayed
    if stgPlayed == 1 {
      vc.currentVC1 = currentStoryBoard as! Mode1ViewController
    }else if stgPlayed == 3 {
      vc.currentVC3 = currentStoryBoard as! Stage3ViewController
    }
    vc.modalPresentationStyle = .overFullScreen
    vc.modalTransitionStyle = .crossDissolve
    currentStoryBoard.present(vc, animated: true)
  }

}

