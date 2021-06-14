//
//  FeedbackPageViewController.swift
//  GoJreng
//
//  Created by Angelica Janissia on 11/06/21.
//

import UIKit

class FeedbackPageViewController: UIViewController {

  @IBOutlet weak var feedbackBG: UIImageView!
  @IBOutlet weak var feedbackTitleLabel: UILabel!
  @IBOutlet weak var feedbackImage: UIImageView!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var newHighScoreLabel: UILabel!
  @IBOutlet weak var feedbackDescLabel: UILabel!
  @IBOutlet weak var primaryButton: UIButton!
  @IBOutlet weak var secondaryButton: UIButton!

  var stageScore: Int?
  var currentHighScore: Int?

  //feedback type 0 - GreatJob
  //feedback type 1 - GameOver
  var feedbackType = 1


  override func viewDidLoad() {
      super.viewDidLoad()

      primaryButton.layer.cornerRadius = 14
      secondaryButton.layer.cornerRadius = 14
      secondaryButton.layer.borderWidth = 2
      secondaryButton.layer.borderColor = #colorLiteral(red: 0.9155033827, green: 0.8542029858, blue: 0.7580156922, alpha: 1)

      stageScore = 500
      currentHighScore = 1000

      switch feedbackType {
      case 0:
        feedbackBG.image = #imageLiteral(resourceName: "feedbackGreatJob")
        feedbackTitleLabel.text = "Great Job"
        feedbackImage.image = #imageLiteral(resourceName: "win")
        scoreLabel.text = "\(stageScore ?? 0)"
        feedbackDescLabel.text = "Congratulations! \nReady to enter the next stage?"
        primaryButton.setTitle("Continue", for: .normal)
        secondaryButton.isHidden = true

        newHighScoreLabel.isHidden = Feedback.newHighScore(currentHighScore: currentHighScore ?? 0, stageScore: stageScore ?? 0)

      default: //GameOver
        feedbackBG.image = #imageLiteral(resourceName: "feedbackGameOver")
        feedbackTitleLabel.text = "Game Over"
        feedbackImage.image = #imageLiteral(resourceName: "lose")
        scoreLabel.text = "\(stageScore ?? 0)"
        feedbackDescLabel.text = "No worries, practice makes progress! \nDare to try again?"
        primaryButton.setTitle("Try Again", for: .normal)
        secondaryButton.setTitle("Close", for: .normal)
        newHighScoreLabel.isHidden = Feedback.newHighScore(currentHighScore: currentHighScore ?? 0, stageScore: stageScore ?? 0)
      }

    }

}

class Feedback{
  static func newHighScore (currentHighScore: Int, stageScore: Int) -> Bool {

    if currentHighScore > stageScore {
      // untuk fungsi isHidden
      return true
    }

    else{
      // untuk fungsi isHidden
      return false
    }
  }
}

