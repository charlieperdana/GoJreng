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
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var remainingLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    
    @IBOutlet var Buttons: [UIButton]!
    
    var audioPlayer: AVAudioPlayer?
    
    var questionNum: Int = 0
    var questionAssertArray: [Int] = []
    var score: Int = 0
    
    var status: Bool?
    
    var remaining: Int = 2
    
    var song: String?
    
    var correctSong: String?
    
    var defaults = UserDefaults.standard
    
    //Home
    var highScore: Int = 0
    
    //
    var questionArray: [Int] = [0,1,2,3]
    
    
    var questionShuffle: [String] = []
    
    var arrayNumber: [Int] = [0,1,2,3,4,5,6,7,8,9]
    
    var arrayBaru: [Questions] = [Questions]()
    
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

        Buttons[0].titleLabel?.adjustsFontSizeToFitWidth = true
        Buttons[1].titleLabel?.adjustsFontSizeToFitWidth = true
        Buttons[2].titleLabel?.adjustsFontSizeToFitWidth = true
        Buttons[3].titleLabel?.adjustsFontSizeToFitWidth = true

        Buttons[0].titleLabel?.minimumScaleFactor = 0.5
        Buttons[1].titleLabel?.minimumScaleFactor = 0.5
        Buttons[2].titleLabel?.minimumScaleFactor = 0.5
        Buttons[3].titleLabel?.minimumScaleFactor = 0.5

        Buttons[0].titleLabel?.numberOfLines = 1
        Buttons[1].titleLabel?.numberOfLines = 1
        Buttons[2].titleLabel?.numberOfLines = 1
        Buttons[3].titleLabel?.numberOfLines = 1

        setUpQuestionsStage()
        print(" ini: \(highScore)")
        
        let newArray = questionsForStage2[0..<4].shuffled() + questionsForStage2[4..<7].shuffled() + questionsForStage2[7..<10].shuffled()
        
        scoreLabel.adjustsFontSizeToFitWidth = true
        scoreLabel.minimumScaleFactor = 0.5
        scoreLabel.numberOfLines = 1

        arrayBaru = newArray
        
        print("\(arrayBaru)")
       //questionAssertArray.append(questionNum)
        updateQuestion()
    }

    
    @IBAction func playSound(_ sender: UIButton) {
        let pathToSound = Bundle.main.path(forResource: arrayBaru[questionNum].questionSound, ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToSound)
        
        if remaining == 1{
            playButton.layer.opacity = 0.7
            playButton.isEnabled = false
        }
        
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
            let pathToSound = Bundle.main.path(forResource: arrayBaru[questionNum].answer[0].answerSound, ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Audio Error")
            }
            
            
        } else if sender.tag == 2 {
            let pathToSound = Bundle.main.path(forResource: arrayBaru[questionNum].answer[1].answerSound, ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Audio Error")
            }
            
            
        } else if sender.tag == 3{
            let pathToSound = Bundle.main.path(forResource: arrayBaru[questionNum].answer[2].answerSound, ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Audio Error")
            }
            
            
        }
        else if sender.tag == 4{
            let pathToSound = Bundle.main.path(forResource: arrayBaru[questionNum].answer[3].answerSound, ofType: "mp3")!
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
        
        if arrayBaru[questionNum].answer[sender.tag - 1].isCorrect == true{
            print("Kamu Hebat")
            status = true
        } else {
            print("Ahhh Bodoh Kamu")
            status = false
        }
    }
    
    
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        
        print("Pressed")
        if status == true{
            showCorrectAnswerModal()
            print("Benar")
            score += 100

        } else {
            showWrongAnswerModal()
            print("Salah")
            score += 0
        }

        Buttons.forEach({
            $0.backgroundColor = #colorLiteral(red: 0.9062767625, green: 0.8542633057, blue: 0.7669899464, alpha: 1)
            $0.titleLabel?.textColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
        })
        
        
        if questionNum == 9{
            if score <= highScore{
                //score = highScore
                print("skor masih kurang")

            } else {
                print("new HG")
                highScore = score
                print(" ini HG:  \(highScore)")
                PageHelper.showFeedback(stgPlayed: 2, stgScore: score, currentStoryBoard: self)
            }
        }
        
        print("\(score)")
        
        
        
        print(" ini Cuk: \(highScore)")
        print("question num : \(questionNum)")
        
        playButton.isEnabled = true
        playButton.layer.opacity = 1
        questionNum += 1
        scoreLabel.text = "\(score)"
        questionAssertArray.append(questionNum - 1)
        updateQuestion()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.layer.cornerRadius = 4
        
        if questionAssertArray.contains(indexPath.row) {
            cell.backgroundColor =  #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
        } else {
            cell.backgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
        return cell

    }

    
    func updateQuestion(){
        
        if questionNum <= arrayBaru.count - 1{
            song = arrayBaru[questionNum].questionSound
            correctSong = arrayBaru[questionNum].questionSoundName
            Buttons[0].setTitle(arrayBaru[questionNum].answer[questionArray[0]].answerLabel, for: UIControl.State.normal)
            Buttons[1].setTitle(arrayBaru[questionNum].answer[questionArray[1]].answerLabel, for: UIControl.State.normal)
            Buttons[2].setTitle(arrayBaru[questionNum].answer[questionArray[2]].answerLabel, for: UIControl.State.normal)
            Buttons[3].setTitle(arrayBaru[questionNum].answer[questionArray[3]].answerLabel, for: UIControl.State.normal)
            
        } else {
            print("Ini kepanggil")
            PageHelper.showFeedback(stgPlayed: 2 , stgScore: score, currentStoryBoard: self)
        }
        
        remaining = 2
        remainingLabel.text = "Remaining: \(remaining)x"
        audioPlayer?.stop()
        checkButton.isEnabled = false
        checkButton.backgroundColor = #colorLiteral(red: 0.5811545253, green: 0.5523337722, blue: 0.5264291167, alpha: 1)
        indikatorCollection.reloadData()
        
        print("\(questionNum)")
    }

    
    @IBAction func exitPressed(_ sender: UIButton) {
        let modalStoryBoard = UIStoryboard(name: "ExitMenuStoryboard", bundle: nil)
        let vc = modalStoryBoard.instantiateViewController(identifier: "exitModal") as! ExitMenuViewController

        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: false)
//        showExitModal()
    }
    
    @objc func showExitModal() {
        print("exit tapped")
        let exitModality = ExitOverlayView()
        exitModality.modalPresentationStyle = .custom
        exitModality.transitioningDelegate = self
        self.present(exitModality, animated: true, completion: nil)

    }
    
    func showCorrectAnswerModal(){
        let modalstoryboard = UIStoryboard(name: "BaseModality", bundle: nil)
        let vc = modalstoryboard.instantiateViewController(identifier: "correct") as! ModalityViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate = self
        
        vc.indexQuestion = questionNum
       self.present(vc, animated: true)
    }
    
    func showWrongAnswerModal(){
        let modalstoryboard = UIStoryboard(name: "BaseModality", bundle: nil)
        let vc = modalstoryboard.instantiateViewController(identifier: "wrong") as! ModalityViewController
        vc.text = correctSong
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate = self
        vc.indexQuestion = questionNum
        self.present(vc, animated: true)
    }
    
}


extension SecondStageViewController : UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        ExitPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

extension SecondStageViewController: ModalityViewControllerDelegate {
    func toHome(authorized: Bool) {
        if authorized {
            //showPage after last questions
            PageHelper.showFeedback(stgPlayed: 2, stgScore: score, currentStoryBoard: self)
        }
    }
}
