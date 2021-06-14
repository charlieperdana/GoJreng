//
//  SecondStageViewController.swift
//  GoJreng
//
//  Created by Dion Lamilga on 11/06/21.
//

import UIKit
import AVFoundation

class SecondStageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var indikatorCollection: UICollectionView!
    @IBOutlet weak var scoreImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var exitImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var remainingLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    
    @IBOutlet var Buttons: [UIButton]!
    
    var audioPlayer: AVAudioPlayer?
    
    var allQuestion = ListQuestion()
    
    var questionNum: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    var status: Bool?
    
    var remaining: Int = 2
    
    var song: String?
    
   // let allQuestion = Stages(stageName: "A", stageState: .unlocked, question: questionsForStage2, questionNumber: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        indikatorCollection.dataSource = self
        indikatorCollection.delegate = self
        
        checkButton.layer.cornerRadius = 14
        
        checkButton.isEnabled = false
        
        Buttons[0].layer.cornerRadius = 8
        Buttons[1].layer.cornerRadius = 8
        Buttons[2].layer.cornerRadius = 8
        Buttons[3].layer.cornerRadius = 8
        
        print("Hallo")
        
        updateQuestion()
    }

    
    @IBAction func playSound(_ sender: UIButton) {
        let pathToSound = Bundle.main.path(forResource: song, ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToSound)
        
        if remaining == 0{
            audioPlayer?.stop()
        } else {
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Audio Error")
            }
            
            remaining -= 1
        }
        
        remainingLabel.text = "Remaining: \(remaining)x"
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        if sender.tag == 1{
            let pathToSound = Bundle.main.path(forResource: allQuestion.list[questionNum].optionA, ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Audio Error")
            }
            
        } else if sender.tag == 2{
            let pathToSound = Bundle.main.path(forResource: allQuestion.list[questionNum].optionB, ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Audio Error")
            }
            
        } else if sender.tag == 3{
            let pathToSound = Bundle.main.path(forResource: allQuestion.list[questionNum].optionC, ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Audio Error")
            }
            
        }
        else if sender.tag == 4{
            let pathToSound = Bundle.main.path(forResource: allQuestion.list[questionNum].optionD, ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Audio Error")
            }
            
        }
        Buttons.forEach({
            $0.backgroundColor = #colorLiteral(red: 0.9062767625, green: 0.8542633057, blue: 0.7669899464, alpha: 1)
            $0.titleLabel?.textColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
            
            checkButton.isEnabled = true
            checkButton.backgroundColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
            checkButton.titleLabel?.textColor = #colorLiteral(red: 0.9062767625, green: 0.8542633057, blue: 0.7669899464, alpha: 1)
        })
        
        sender.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1);
        sender.titleLabel?.textColor = #colorLiteral(red: 0.9062767625, green: 0.8542633057, blue: 0.7669899464, alpha: 1)
        
        if sender.tag == selectedAnswer{
            print("Kamu Hebat")
            status = true
            //score += 100
        } else {
            print("Ahhh Bodoh Kamu")
        }
    }
    
    
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        
        if status == true{
            score += 100
        } else {
            score += 0
        }
        
        Buttons.forEach({
            $0.backgroundColor = #colorLiteral(red: 0.9062767625, green: 0.8542633057, blue: 0.7669899464, alpha: 1)
            $0.titleLabel?.textColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
        })
        
        scoreLabel.text = "\(score)"
        
        updateQuestion()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.layer.cornerRadius = 4
            
            var newNumber = questionNum - 1
        
        if indexPath.row == newNumber{
            if indexPath.row <= newNumber{
                cell.backgroundColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
            }
        }
            
//            if indexPath.row == 9{
//                cell.backgroundColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
//            }
//            if indexPath.row == 8{
//                cell.backgroundColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
//            }
//            if indexPath.row == 7{
//                cell.backgroundColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
//            }
//            if indexPath.row == 6{
//                cell.backgroundColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
//            }
//            if indexPath.row == 5{
//                cell.backgroundColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
//            }
//            if indexPath.row == 4{
//                cell.backgroundColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
//            }
//            if indexPath.row == 3{
//                cell.backgroundColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
//            }
//            if indexPath.row == 2{
//                cell.backgroundColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
//            }
//            if indexPath.row == 1{
//                cell.backgroundColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
//            }
//            if indexPath.row == 0{
//                cell.backgroundColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
//            }
        
            return cell

    }

    
    func updateQuestion(){
        
        song = allQuestion.list[questionNum].song
        Buttons[0].setTitle(allQuestion.list[questionNum].optionA, for: UIControl.State.normal)
        Buttons[1].setTitle(allQuestion.list[questionNum].optionB, for: UIControl.State.normal)
        Buttons[2].setTitle(allQuestion.list[questionNum].optionC, for: UIControl.State.normal)
        Buttons[3].setTitle(allQuestion.list[questionNum].optionD, for: UIControl.State.normal)
        selectedAnswer = allQuestion.list[questionNum].jawaban
        
        questionNum += 1
        remaining = 2
        remainingLabel.text = "Remaining: \(remaining)x"
        audioPlayer?.stop()
        indikatorCollection.reloadData()
        
        
        print("\(questionNum)")
    }

}
