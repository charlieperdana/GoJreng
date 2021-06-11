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
    
    var questionArray = ["A", "bm", "C", "f#m"]
    
    var player: AVAudioPlayer?
    var timer = 90
    
    var soundIsPlaying = false
    var lifeCount = 3
    var qIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.majorButton.layer.cornerRadius = 10
        self.majorButton.clipsToBounds = true
        self.minorButton.layer.cornerRadius = 10
        self.minorButton.clipsToBounds = true
        
//        test question
        setUpQuestionsStage()
        
//        timer setup
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func playSoundClicked(_ sender: Any) {
        if (soundIsPlaying == false && qIndex < questionArray.count - 1){
            playSound(soundFileName: questionArray[qIndex])
            if (qIndex <= questionArray.count - 1){
                qIndex += 1
            }
        }
        else{
//            todo gameover
            print("false")
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
        let chord = questionArray[qIndex-1]
        print("ANS: " + chord)
        var isCorrect: Bool
//        if minor
        if chord.contains("m") {
            isCorrect = choice == "minor"
        }
        else{ //if major
            isCorrect = choice == "major"
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
//        TODO handle nambah poin
        showCorrectAnswerModal()
        
    }
    
    func wrongAnswerSequence(){
        if (lifeCount <= 0){ // decrease life count
//            TODO handle game over
            print("gemover!!")
            return
        }
        lifePicks[lifeCount-1].isHidden = true
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
    }
    
    func showWrongAnswerModal(){
        let modalstoryboard = UIStoryboard(name: "BaseModality", bundle: nil)
        let vc = modalstoryboard.instantiateViewController(withIdentifier: "wrongSimple")
        vc.modalPresentationStyle = .overFullScreen //or .overFullScreen for transparency
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
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
    
//    update timer
    @objc func update() {
        if(timer > 0) {
            timer -= 1
            timerLabel.text = String(timer)
        }
    }
}
