//
//  FeedbackPageViewController.swift
//  GoJreng
//
//  Created by Angelica Janissia on 11/06/21.
//

import UIKit

class FeedbackPageViewController: UIViewController {

  @IBOutlet weak var feedbackTitleLabel: UILabel!
  @IBOutlet weak var feedbackImage: UIImageView!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var newHighScoreLabel: UILabel!
  @IBOutlet weak var feedbackDescLabel: UILabel!
  @IBOutlet weak var primaryButton: UIButton!
  @IBOutlet weak var secondaryButton: UIButton!

  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

class Feedback{

  struct feedbackStruct{
    var feedbackTitle: String
    var feedbackBG : UIImage
    var feedbackImg: UIImage
    var score : Int
    var newHighScore : Bool
    var feedbackDesc : String
    var primaryButtonText: String
    var secondaryButtonText: String
  }


  func feedbackGreatJob (title: String, stageScore: Int) -> feedbackStruct {
    //belum ada cek highscore
    let content = feedbackStruct(feedbackTitle: "Great Job", feedbackBG: #imageLiteral(resourceName: "Feedback Page Congrats") ,feedbackImg: #imageLiteral(resourceName: "win"), score: stageScore, newHighScore: true, feedbackDesc: "Congratulations! \nReady to enter the next stage?", primaryButtonText: "Continue", secondaryButtonText: "")

    return content
  }

  func feedbackGameOver (title: String, stageScore: Int) -> feedbackStruct {
    //belum ada cek highscore
    let content = feedbackStruct(feedbackTitle: "GameOver", feedbackBG: #imageLiteral(resourceName: "Feedback Page Game Over"), feedbackImg: #imageLiteral(resourceName: "lose") , score: stageScore, newHighScore: true, feedbackDesc: "No worries, practice makes progress! \nDare to try again?", primaryButtonText: "Try Again", secondaryButtonText: "Close")

    return content
  }
}

