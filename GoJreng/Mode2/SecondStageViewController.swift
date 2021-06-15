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
    
    //Home
    var highScore: Int = 0
    
    //
    var questionArray: [Int] = [0,1,2,3]
    
    
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
        
        setUpQuestionsStage()
        print(" ini: \(highScore)")
        
        questionAssertArray.append(questionNum)
        updateQuestion()
    }

    
    @IBAction func playSound(_ sender: UIButton) {
        let pathToSound = Bundle.main.path(forResource: questionsForStage2[questionNum].questionSound, ofType: "mp3")!
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
            let pathToSound = Bundle.main.path(forResource: questionsForStage2[questionNum].answer[0].answerSound, ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Audio Error")
            }
            
            
        } else if sender.tag == 2 {
            let pathToSound = Bundle.main.path(forResource: questionsForStage2[questionNum].answer[1].answerSound, ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Audio Error")
            }
            
            
        } else if sender.tag == 3{
            let pathToSound = Bundle.main.path(forResource: questionsForStage2[questionNum].answer[2].answerSound, ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Audio Error")
            }
            
            
        }
        else if sender.tag == 4{
            let pathToSound = Bundle.main.path(forResource: questionsForStage2[questionNum].answer[3].answerSound, ofType: "mp3")!
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
        
        if questionsForStage2[questionNum].answer[sender.tag - 1].isCorrect == true{
            correctSong = questionsForStage2[questionNum].answer[sender.tag - 1].answerLabel
            print("Kamu Hebat")
            status = true
            //score += 100
        } else {
            print("\(correctSong)")
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
            //showFeedback()
            print("Salah")
            score += 0
        }

        Buttons.forEach({
            $0.backgroundColor = #colorLiteral(red: 0.9062767625, green: 0.8542633057, blue: 0.7669899464, alpha: 1)
            $0.titleLabel?.textColor = #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
        })
        
        
        if questionNum == 9{
            if score <= highScore{
                score = highScore
                print("skor masih kurang")
                showHomePage()
            } else {
                print("new HG")
                highScore = score
                print(" ini HG:  \(highScore)")
                showHomePage()
            }
        }
        
        print(" ini Cuk: \(highScore)")
        print("question num : \(questionNum)")
        
        playButton.isEnabled = true
        playButton.layer.opacity = 1
        questionNum += 1
        scoreLabel.text = "\(score)"
        questionAssertArray.append(questionNum)
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
        
        if questionNum <= questionsForStage2.count - 1{
            song = questionsForStage2[questionNum].questionSound
            Buttons[0].setTitle(questionsForStage2[questionNum].answer[questionArray[0]].answerLabel, for: UIControl.State.normal)
            Buttons[1].setTitle(questionsForStage2[questionNum].answer[questionArray[1]].answerLabel, for: UIControl.State.normal)
            Buttons[2].setTitle(questionsForStage2[questionNum].answer[questionArray[2]].answerLabel, for: UIControl.State.normal)
            Buttons[3].setTitle(questionsForStage2[questionNum].answer[questionArray[3]].answerLabel, for: UIControl.State.normal)
            
        } else {
            print("Ini kepanggil")
            showFeedback()
        }
        
        remaining = 2
        remainingLabel.text = "Remaining: \(remaining)x"
        audioPlayer?.stop()
        checkButton.isEnabled = false
        checkButton.backgroundColor = #colorLiteral(red: 0.5811545253, green: 0.5523337722, blue: 0.5264291167, alpha: 1)
        indikatorCollection.reloadData()
        
        print("\(questionNum)")
    }
    
    func updateUI(){
        
    }
    
    
    @IBAction func exitPressed(_ sender: UIButton) {
        showExitModal()
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
        self.present(vc, animated: true)
    }
    
    func showWrongAnswerModal(){
        let modalstoryboard = UIStoryboard(name: "BaseModality", bundle: nil)
        let vc = modalstoryboard.instantiateViewController(identifier: "wrongSimple") as! ModalityViewController
        vc.text = correctSong
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
//        vc.dismiss(animated: true, completion: {
//
//        })
    }
    
    func showFeedback(){
        let modalstoryboard = UIStoryboard(name: "FeedbackPage", bundle: nil)
        let vc = modalstoryboard.instantiateViewController(identifier: "feedbackPage") as! FeedbackPageViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    func showHomePage(){
        let modalstoryboard = UIStoryboard(name: "HomeP", bundle: nil)
        let vc = modalstoryboard.instantiateViewController(identifier: "HomeView") as! HomePageViewController
        vc.newHighScore = score
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
}

extension SecondStageViewController : UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        ExitPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
