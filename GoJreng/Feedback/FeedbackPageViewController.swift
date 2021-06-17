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
  @IBOutlet weak var stackViewBottom: NSLayoutConstraint!

  //send this to feedbackPage
  var stagePlayed: Int?
  var stageScore: Int?
  var currentHighScore: Int?

  //feedback type 0 - GreatJob
  //feedback type 1 - GameOver
  var feedbackType: Int?
  var newHighScore: Int?


  override func viewDidLoad() {
      super.viewDidLoad()

      primaryButton.layer.cornerRadius = 14
      secondaryButton.layer.cornerRadius = 14
      secondaryButton.layer.borderWidth = 2
      secondaryButton.layer.borderColor = #colorLiteral(red: 0.9155033827, green: 0.8542029858, blue: 0.7580156922, alpha: 1)

      stageScore = 1200
      currentHighScore = 1000
      feedbackType = FeedbackHelper.getFeedbackPage(curHighScore: currentHighScore ?? 0, stgScore: stageScore ?? 0)
      newHighScore = PageHelper.highScoreChanger(stgScore: stageScore ?? 0, curHighScore: currentHighScore ?? 0)
      FeedbackType()
      setupStackView()

    }

  @IBAction func primaryButtonAction(_ sender: Any) {
    if feedbackType == 0 {
      //greatJob -> homePage
      PageHelper.showHomePage(newHighS: newHighScore ?? 0, currentStoryBoard: self)
    }
    else{
      //tryagain
      switch stagePlayed {
      case 1:
        PageHelper.showStage1(currentStoryBoard: self)
      case 2:
        PageHelper.showStage2(newHighScore: newHighScore ?? 0, currentStoryBoard: self)
      case 3:
        PageHelper.showStage3()
      default:
        PageHelper.showHomePage(newHighS: newHighScore ?? 0, currentStoryBoard: self)
      }

    }
  }

  @IBAction func secondaryButtonAction(_ sender: Any) {
    PageHelper.showHomePage(newHighS: currentHighScore ?? 0, currentStoryBoard: self)
  }

  func FeedbackType(){
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

      stackViewBottom.constant = 56

    default: //GameOver
      feedbackBG.image = #imageLiteral(resourceName: "feedbackGameOver")
      feedbackTitleLabel.text = "Game Over"
      feedbackImage.image = #imageLiteral(resourceName: "lose")
      scoreLabel.text = "\(stageScore ?? 0)"
      feedbackDescLabel.text = "No worries, practice makes progress! \nDare to try again?"
      primaryButton.setTitle("Try Again", for: .normal)
      secondaryButton.setTitle("Close", for: .normal)
      newHighScoreLabel.isHidden = true

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

