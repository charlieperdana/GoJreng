//
//  Mode1ViewController.swift
//  GoJreng
//
//  Created by Alif Mahardhika on 11/06/21.
//

import UIKit
import AVFoundation


class Mode1ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var majorButton: UIButton!
    @IBOutlet weak var minorButton: UIButton!
    @IBOutlet var lifePicks: [UIImageView]!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var rightPlayButton: UIButton!
    
    var questionArray: [String]?
    
    var player: AVAudioPlayer!
    var timerSound: AVAudioPlayer!
    var soundEffectPlayer: AVAudioPlayer!
    var timer = 90
    
    var soundIsPlaying = false
    var lifeCount = 3
    var qIndex = 0
    var score = 0
    var isShowingFeedBack = false
    var timerInstance: Timer?
    
    var highScore: Int = 0
    
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.majorButton.layer.cornerRadius = 10
        self.majorButton.clipsToBounds = true
        self.minorButton.layer.cornerRadius = 10
        self.minorButton.clipsToBounds = true
        
//        test question
        if majorQuestionsAnswers.count == 0{
            setUpQuestionsStage()
        }
        questionArray = majorQuestionsAnswers + minorQuestionsAnswers
        questionArray?.shuffle()
        
//        timer setup
        timerInstance = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        playQuestion(index: qIndex)
    }
    
    func playQuestion(index: Int){
        playSound(soundFileName: questionArray![index])
        
    }
    
    @IBAction func playSoundClicked(_ sender: Any) {
        if (soundIsPlaying == false && qIndex <= questionArray!.count - 1){
            playSound(soundFileName: questionArray![qIndex])
        }
        else{
            if soundIsPlaying == true {
                return
            }
            else {
                print("questionarray index logic error")
            }
        }
    }
    
    @IBAction func majorTouched(_ sender: Any) {
        player?.stop()
        soundIsPlaying = false
        checkAnswer(choice: "major", button: majorButton)
        majorButton.isEnabled = false
        minorButton.isEnabled = false
    }
    
    @IBAction func minorTouched(_ sender: Any) {
        player?.stop()
        soundIsPlaying = false
        checkAnswer(choice: "minor", button: minorButton)
        majorButton.isEnabled = false
        minorButton.isEnabled = false
    }
    
    func checkAnswerSoundEffect(isCorrect: Bool){
        var name = ""
        if isCorrect{
            name = "correctAnswer"
        } else {
            name = "wrongAnswer"
        }
        guard let soundFile = Bundle.main.path(forResource: name, ofType: "mp3") else {return}
        let urlSound = URL(fileURLWithPath: soundFile )
        do {
            soundEffectPlayer = try AVAudioPlayer(contentsOf: urlSound)
            soundEffectPlayer.volume = 0.5
            soundEffectPlayer.play()
        }
        catch {
            print(error)
        }
    }
    
    func checkAnswer(choice: String, button: UIButton) {
        print("CHOICE: " + choice)
        var chord: String
        if qIndex == 0{
            chord = questionArray![qIndex]
        }
        else{
            chord = questionArray![qIndex]
        }
        print("ANS: " + chord)
        var isCorrect: Bool
//        if minor
        if chord.contains("minor") {
            isCorrect = choice == "minor"
        }
        else{ //if major
            isCorrect = choice == "major"
        }
        checkAnswerSoundEffect(isCorrect: isCorrect)
        if (qIndex < questionArray!.count){
            qIndex += 1
        }
        if isCorrect{
            rightAnswerSequence(button: button)
            return
        }
//        kalo salah
        wrongAnswerSequence(button: button)
    }
    
    func rightAnswerSequence(button: UIButton){
//        buat siapatau mau play sound effect kalo bener
        score += 100
        scoreLabel.text = String(score)
        let prevColor = button.backgroundColor
        button.backgroundColor = UIColor.green
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            button.backgroundColor = prevColor //change it back to original
            self.checkFinished()
        }
    }
    
    func wrongAnswerSequence(button: UIButton){
        lifePicks[lifeCount-1].image = UIImage(named: "deadPicks")
        lifeCount -= 1
        let prevColor = button.backgroundColor
        button.backgroundColor = UIColor.red
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            button.backgroundColor = prevColor //change it back to original
            self.checkFinished()
        }
        
    }
    
    func playSound(soundFileName: String){
        let fileUrl = Bundle.main.path(forResource: soundFileName, ofType: "mp3")
        playButton.isEnabled = false
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let fileUrl = fileUrl else{
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileUrl))
            player!.delegate = self
            soundIsPlaying = true
            guard let player = player else{
                return
            }
            player.volume = 2
            player.play()
            
        } catch {
            print("failed sound")
        }
    }
    
//    Check if audio finished playing
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        soundIsPlaying = false
        playButton.isEnabled = true
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        let modalStoryBoard = UIStoryboard(name: "ExitMenuStoryboard", bundle: nil)
        let vc = modalStoryBoard.instantiateViewController(identifier: "exitModal") as! ExitMenuViewController

        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: false)
    }
    
//
//
//    @objc func showExitModal() {
//        print("exit tapped")
//        let exitModality = ExitOverlayView()
//        exitModality.modalPresentationStyle = .custom
//        exitModality.transitioningDelegate = self
//        self.present(exitModality, animated: true, completion: nil)
//
//    }
//
    
//    update timer
    @objc func update() {
        if(timer > 0) {
            timer -= 1
            timerLabel.text = String(timer)
            if timer == 10{
                guard let pathQuestionSound = Bundle.main.path(forResource: "timer 10s", ofType: "mp3") else {return}
                
                let urlTimerSound = URL(fileURLWithPath: pathQuestionSound )
                do {
                    timerSound = try AVAudioPlayer(contentsOf: urlTimerSound)
                    timerSound.volume = 2
                    timerSound.play()
                }
                catch {
                    print(error)
                }
            }
        }
        else {
            
            checkFinished()
        }
    }
    func checkFinished(){
        majorButton.backgroundColor = GoJrengColors.WindsorTan
        minorButton.backgroundColor = GoJrengColors.WindsorTan
        if score <= highScore{
            //score = highScore
            print("Masih Kurang")
        } else{
            print("New HS")
            highScore = score
        }
        
//        life
        if lifeCount > 0{
//            check if time's up
            if timer <= 0 && !isShowingFeedBack{//ggl
                isShowingFeedBack = true
                timerInstance?.invalidate()
                timerInstance = nil
                PageHelper.showFeedback(stgPlayed: 1, stgScore: score, currentStoryBoard: self)
                return
            }
            if soundIsPlaying == false && qIndex >= questionArray!.count{
                print("finished 24, randomizing new arr")//bhsl
                qIndex = 0
                questionArray = questionArray?.shuffled()
//                PageHelper.showFeedback(stgPlayed: 1, stgScore: score, currentStoryBoard: self)
//                return
            }
            print("continue + " + String(qIndex))
            animatePlayButton{ (success) -> Void in
                if success {
                    playQuestion(index: qIndex)
                    majorButton.isEnabled = true
                    minorButton.isEnabled = true
                }
            }
        }
//        dead
        else{//ggl
            timerInstance?.invalidate()
            timerInstance = nil
            PageHelper.showFeedback(stgPlayed: 1, stgScore: score, currentStoryBoard: self)
            return
        }
    }
    
    func animatePlayButton(completion: (_ success: Bool) -> Void){
        majorButton.isEnabled = false
        minorButton.isEnabled = false
        let midy = self.playButton.frame.origin.y
        let righty = self.rightPlayButton.frame.origin.y
//        let initxActual = self.playButton.frame.midX

        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                //Frame Option 1:
            self.playButton.frame = CGRect(x: 0 - self.playButton.frame.width, y: midy, width: self.playButton.frame.width, height: self.playButton.frame.height)
            
            
            self.rightPlayButton.frame = CGRect(x: self.view.frame.midX - self.rightPlayButton.frame.width/2, y: righty, width: self.rightPlayButton.frame.width, height: self.rightPlayButton.frame.height)
            self.playButton.isEnabled = true
            },completion: { finish in
                UIView.animate(withDuration: 0.7, delay: 0,options: UIView.AnimationOptions.curveEaseOut,animations: {
                self.rightPlayButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            },
                completion:  { finish in
                    self.restoreButtonPosition()
                }
                )})
        
        completion(true)
    }
    
    func restoreButtonPosition(){
        let mid = self.view.frame.midX
        let size = playButton.frame.width
        playButton.frame = CGRect(x: mid - size/2, y: playButton.frame.origin.y, width: size, height: size)
        
//        let rmid = self.view.frame.midX
        rightPlayButton.frame = CGRect(x: 500, y: playButton.frame.origin.y, width: size/1.5, height: size/1.5)
        majorButton.isEnabled = true
        minorButton.isEnabled = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timerInstance?.invalidate()
        timerSound = nil
        soundEffectPlayer = nil
        player = nil
        soundIsPlaying = false
    }

}

//extension Mode1ViewController : UIViewControllerTransitioningDelegate {
//    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
//        ExitPresentationController(presentedViewController: presented, presenting: presenting)
//    }
//}
