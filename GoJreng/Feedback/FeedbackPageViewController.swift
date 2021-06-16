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
  @IBOutlet weak var scoreTitleLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var newHighScoreLabel: UILabel!
  @IBOutlet weak var feedbackDescLabel: UILabel!
  @IBOutlet weak var primaryButton: UIButton!
  @IBOutlet weak var secondaryButton: UIButton!
  @IBOutlet weak var stackViewFeedback: UIStackView!

  var stageScore: Int?
  var currentHighScore: Int?

  //feedback type 0 - GreatJob
  //feedback type 1 - GameOver
  var feedbackType: Int?



  override func viewDidLoad() {
      super.viewDidLoad()

      primaryButton.layer.cornerRadius = 14
      secondaryButton.layer.cornerRadius = 14
      secondaryButton.layer.borderWidth = 2
      secondaryButton.layer.borderColor = #colorLiteral(red: 0.9155033827, green: 0.8542029858, blue: 0.7580156922, alpha: 1)

      stageScore = 1200
      currentHighScore = 1000


      FeedbackType()
      setupStackView()


    }


  func FeedbackType(){
    feedbackType = FeedbackHelper.getFeedbackPage(curHighScore: currentHighScore ?? 0, stgScore: stageScore ?? 0)

    switch feedbackType {
    case 0:
      feedbackBG.image = #imageLiteral(resourceName: "feedbackGreatJob")
      feedbackTitleLabel.text = "Great Job"
      feedbackImage.image = #imageLiteral(resourceName: "win")
      scoreLabel.text = "\(stageScore ?? 0)"
      feedbackDescLabel.text = "Congratulations! \nReady to enter the next stage?"
      primaryButton.setTitle("Continue", for: .normal)
      secondaryButton.isHidden = true
      newHighScoreLabel.isHidden = false

      stackViewFeedback.setCustomSpacing(80, after: primaryButton)

    default: //GameOver
      feedbackBG.image = #imageLiteral(resourceName: "feedbackGameOver")
      feedbackTitleLabel.text = "Game Over"
      feedbackImage.image = #imageLiteral(resourceName: "lose")
      scoreLabel.text = "\(stageScore ?? 0)"
      feedbackDescLabel.text = "No worries, practice makes progress! \nDare to try again?"
      primaryButton.setTitle("Try Again", for: .normal)
      secondaryButton.setTitle("Close", for: .normal)
      newHighScoreLabel.isHidden = true //Feedback.newHighScore(currentHighScore: currentHighScore ?? 0, stageScore: stageScore ?? 0)

      stackViewFeedback.setCustomSpacing(40, after: scoreLabel)
      stackViewFeedback.setCustomSpacing(24, after: newHighScoreLabel)
    }
  }

  func setupStackView(){
    view.addSubview(stackViewFeedback)
    stackViewFeedback.setCustomSpacing(40, after: feedbackTitleLabel)
    stackViewFeedback.setCustomSpacing(16, after: feedbackImage)
    stackViewFeedback.setCustomSpacing(0, after: scoreTitleLabel)
    stackViewFeedback.setCustomSpacing(0, after: scoreLabel)
    stackViewFeedback.setCustomSpacing(24, after: newHighScoreLabel)
    stackViewFeedback.setCustomSpacing(32, after: feedbackDescLabel)
    stackViewFeedback.setCustomSpacing(20, after: primaryButton)
    stackViewFeedback.setCustomSpacing(0, after: secondaryButton)

    feedbackDescLabel.adjustsFontSizeToFitWidth = true
    feedbackDescLabel.minimumScaleFactor = 0.2
    feedbackDescLabel.numberOfLines = 2
  }

}

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

