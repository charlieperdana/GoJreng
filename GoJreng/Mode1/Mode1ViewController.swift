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
    
    var questionArray: [String]?
    
    var player: AVAudioPlayer?
    var timer = 90
    
    var soundIsPlaying = false
    var lifeCount = 3
    var qIndex = 0
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.majorButton.layer.cornerRadius = 10
        self.majorButton.clipsToBounds = true
        self.minorButton.layer.cornerRadius = 10
        self.minorButton.clipsToBounds = true
        
//        test question
        setUpQuestionsStage()
        questionArray = majorQuestionsAnswers + minorQuestionsAnswers
        questionArray?.shuffle()

//        timer setup
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
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
        checkAnswer(choice: "major")
    }
    
    @IBAction func minorTouched(_ sender: Any) {
        player?.stop()
        soundIsPlaying = false
        checkAnswer(choice: "minor")
    }
    
    func checkAnswer(choice: String) {
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
        
        if (qIndex < questionArray!.count){
            qIndex += 1
        }
        if isCorrect{
            rightAnswerSequence()
            return
        }
//        kalo salah
        wrongAnswerSequence()
    }
    
    func rightAnswerSequence(){
//        buat siapatau mau play sound effect kalo bener
        score += 100
        scoreLabel.text = String(score)
        showCorrectAnswerModal()
        
    }
    
    func wrongAnswerSequence(){
        lifePicks[lifeCount-1].image = UIImage(named: "deadPicks")
        lifeCount -= 1
//        show modal
        showWrongAnswerModal()
    }
    
    func showCorrectAnswerModal(){
        let modalstoryboard = UIStoryboard(name: "BaseModality", bundle: nil)
        let vc = modalstoryboard.instantiateViewController(withIdentifier: "correct")
        vc.modalPresentationStyle = .overFullScreen //or .overFullScreen for transparency
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
        vc.dismiss(animated: true, completion: {
                    self.checkFinished()})
    }
    
    func showWrongAnswerModal(){
        let modalstoryboard = UIStoryboard(name: "BaseModality", bundle: nil)
        let vc = modalstoryboard.instantiateViewController(withIdentifier: "wrongSimple")
        vc.modalPresentationStyle = .overFullScreen //or .overFullScreen for transparency
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
        vc.dismiss(animated: true, completion: {
                    self.checkFinished()})
    }
    
    func playSound(soundFileName: String){
        let fileUrl = Bundle.main.path(forResource: soundFileName, ofType: "mp3")
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
        print("calledx")
        soundIsPlaying = false
    }
    
    func feedbackSequence(type: Int){
        let modalstoryboard = UIStoryboard(name: "FeedbackPage", bundle: nil)
        let vc = modalstoryboard.instantiateViewController(withIdentifier: "fp") as! FeedbackPageViewController
        vc.feedbackType = type
        vc.stageScore =  score
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    @IBAction func testGameover(_ sender: Any) {
        showExitModal()
    }
    
    
    
    @objc func showExitModal() {
        print("exit tapped")
        let exitModality = ExitOverlayView()
        exitModality.modalPresentationStyle = .custom
        exitModality.transitioningDelegate = self
        self.present(exitModality, animated: true, completion: nil)

    }
    
    
//    update timer
    @objc func update() {
        if(timer > 0) {
            timer -= 1
            timerLabel.text = String(timer)
        }
    }
    func checkFinished(){
//        life
        if lifeCount > 0{
//            check if time's up
            if timer <= 0{
                feedbackSequence(type:1)
                return
            }
            if soundIsPlaying == false && qIndex >= questionArray!.count{
                print("finished")
                feedbackSequence(type:0)
                return
            }
            print("continue + " + String(qIndex))
            playQuestion(index: qIndex)
        }
//        dead
        else{
            feedbackSequence(type:1)
            return
        }
    }
}

extension Mode1ViewController : UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        ExitPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
