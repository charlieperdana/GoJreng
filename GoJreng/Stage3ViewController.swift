//
//  Stage3ViewController.swift
//  GoJreng
//
//  Created by Novi Gunawan on 14/06/21.
//

import UIKit
import AVFoundation
class Stage3ViewController: UIViewController{
    
    
    @IBOutlet weak var optionChordCollectonView: UICollectionView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    //var currentQuestion: Questions?
    var seconds = 30
    var timer = Timer()
    var currentQuestionIndex: Int = 8
    var questionSoundsArray: [String] = []
    var score: Int = 0
    
    //answerPlaceholder
    @IBOutlet weak var answer1: UIImageView!
    @IBOutlet weak var answer2: UIImageView!
    @IBOutlet weak var answer3: UIImageView!
    @IBOutlet weak var answer4: UIImageView!
    
    //audio
    var questionSound: AVAudioPlayer!
    var timerSound: AVAudioPlayer!
    
    
    
    var selectedIndex = 0
    //    var itemsChord : [UIImage] = []
    var itemsChord : [String] = []
    
    var concateAnswer : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        //setupQuestions
        setUpQuestionsStage()
        
        //Set questions sounds
        for i in 0..<(stage3.questionNumber) {
            questionSoundsArray.append(questionsForStage3[i].questionSound)
        }
        
        //Check Button is disabled at first
        checkButton.isEnabled = false
        checkButton.backgroundColor = #colorLiteral(red: 0.5803921569, green: 0.5529411765, blue: 0.5254901961, alpha: 1)
        checkButton.setTitleColor(#colorLiteral(red: 0.9058823529, green: 0.8549019608, blue: 0.768627451, alpha: 1), for: .disabled)
        
        
        //        itemsChord = [#imageLiteral(resourceName: "Em"),#imageLiteral(resourceName: "Dm"),#imageLiteral(resourceName: "G"),#imageLiteral(resourceName: "B"),#imageLiteral(resourceName: "A"),#imageLiteral(resourceName: "F"),#imageLiteral(resourceName: "C"),#imageLiteral(resourceName: "Am")]
        itemsChord = ["Em","Dm","G","B","A","F","C","Am"]
        optionChordCollectonView.dataSource = self
        optionChordCollectonView.delegate = self
        
        self.setDragAndDropSettings()
        
    }
    
    func updateQuestion() {
        seconds = 30
        timeLabel.text = "\(seconds)"
        checkButton.isEnabled = false
        checkButton.backgroundColor = #colorLiteral(red: 0.5803921569, green: 0.5529411765, blue: 0.5254901961, alpha: 1)
        checkButton.setTitleColor(#colorLiteral(red: 0.9058823529, green: 0.8549019608, blue: 0.768627451, alpha: 1), for: .disabled)
    }
    @objc func timerCounter() {
        seconds -= 1
        timeLabel.text = "\(seconds)"
        
        //Play sound effects of 10s timer
        if(seconds==10){
            guard let pathQuestionSound = Bundle.main.path(forResource: "timer 10s", ofType: "mp3") else {return}
            
            let urlTimerSound = URL(fileURLWithPath: pathQuestionSound ?? "")
            do {
                timerSound = try AVAudioPlayer(contentsOf: urlTimerSound)
                timerSound.volume = 2
                timerSound.play()
            }
            catch {
                print(error)
            }
        }
        if (seconds==0){
            timer.invalidate()
            questionSound.stop()
            seconds = 30
        }
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        playQuestionSound(questionSoundFileName: questionSoundsArray[currentQuestionIndex])
    }
    
    func playQuestionSound(questionSoundFileName: String) {
        guard let pathQuestionSound = Bundle.main.path(forResource: questionSoundFileName, ofType: "mp3") else {return}
        
        let urlQuestionSounds = URL(fileURLWithPath: pathQuestionSound ?? "")
        
        do {
            questionSound = try AVAudioPlayer(contentsOf: urlQuestionSounds)
            questionSound.volume = 1.7
            questionSound.play()
        } catch  {
            print(error)
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        questionSound.pause()
        exitModal()
    }
    
    func exitModal() {
        let exitModality = ExitOverlayView()
        exitModality.modalPresentationStyle = .custom
        exitModality.transitioningDelegate = self
        self.present(exitModality, animated: true, completion: nil)
    }
    
    func setBackground() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "stage-3") ?? UIImage())
    }
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        
        if questionSound != nil {
            questionSound.stop()
        }
        
        timer.invalidate()
        
        if timerSound != nil{
            timerSound.stop()
        }
        
        //If the answer is true
        if(true){
            score+=100
            scoreLabel.text = "\(score)"
            showCorrectModal()
        }
        else {
            showWrongModal()
        }
        print("Current Question Index = \(currentQuestionIndex)")
        
        if currentQuestionIndex == 9 {
            showFeedback()
        }
        else{
            currentQuestionIndex+=1
            updateQuestion()
            print("Current question index setelah tap check button : \(currentQuestionIndex)")
        }
        
    }
    func showFeedback() {
        let feedbackStoryboard = UIStoryboard(name: "FeedbackPage", bundle: nil)
        let vc = feedbackStoryboard.instantiateViewController(identifier: "feedback") as! FeedbackPageViewController
        print(score)
        vc.stageScore = score
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        
        self.present(vc, animated: true)
    }
    func showCorrectModal() {
        let modalStoryboard = UIStoryboard(name: "BaseModality", bundle: nil)
        let vc = modalStoryboard.instantiateViewController(identifier: "correct") as! ModalityViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    func showWrongModal() {
        let modalStoryboard = UIStoryboard(name: "BaseModality", bundle: nil)
        let vc = modalStoryboard.instantiateViewController(identifier: "wrong") as! ModalityViewController
        //vc.text = correctSong
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
        
    }
    func setDragAndDropSettings(){
        
        optionChordCollectonView.dragDelegate = self
        optionChordCollectonView.dragInteractionEnabled = true
        
        answer1.isUserInteractionEnabled = true
        answer2.isUserInteractionEnabled = true
        answer3.isUserInteractionEnabled = true
        answer4.isUserInteractionEnabled = true
        
        
        self.view.isUserInteractionEnabled = true
        
        let dragInteraction1 = UIDragInteraction(delegate: self)
        dragInteraction1.isEnabled = true
        
        let dragInteraction2 = UIDragInteraction(delegate: self)
        dragInteraction2.isEnabled = true
        
        let dragInteraction3 = UIDragInteraction(delegate: self)
        dragInteraction3.isEnabled = true
        
        let dragInteraction4 = UIDragInteraction(delegate: self)
        dragInteraction4.isEnabled = true
        
        let dropInteraction1 = UIDropInteraction(delegate: self)
        let dropInteraction2 = UIDropInteraction(delegate: self)
        let dropInteraction3 = UIDropInteraction(delegate: self)
        let dropInteraction4 = UIDropInteraction(delegate: self)
        
        //Add Drop interaction for DropImageView
        answer1.addInteraction(dropInteraction1)
        answer2.addInteraction(dropInteraction2)
        answer3.addInteraction(dropInteraction3)
        answer4.addInteraction(dropInteraction4)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        print("Answer "+concateAnswer)
    }
}
extension Stage3ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        ExitPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

extension Stage3ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsChord.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:"answerCell", for: indexPath) as! AnswersCollectionVC
        //        cell.imageOptionChord.image = itemsChord[indexPath.row]
        cell.imageOptionChord.image = UIImage(named: "\(itemsChord[indexPath.row])")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        //        let item = self.itemsChord[indexPath.row]
        let item = UIImage(named: "\(self.itemsChord[indexPath.row])")
        let itemProvider = NSItemProvider(object: item! as UIImage)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        selectedIndex = indexPath.row + 1
        
        //setAnswer
        self.concateAnswer += "\(itemsChord[indexPath.row])-"
        
        //change the cell after drag
        //        itemsChord[indexPath.row] = #imageLiteral(resourceName: "noChord")
        itemsChord[indexPath.row] = "noChord"
        //        optionChordCollectonView.reloadData()
        
        checkButton.isEnabled = true
        checkButton.backgroundColor = #colorLiteral(red: 0.631372549, green: 0.3490196078, blue: 0.09019607843, alpha: 1)
        checkButton.setTitleColor(#colorLiteral(red: 0.9058823529, green: 0.8549019608, blue: 0.768627451, alpha: 1), for: .normal)
        
        return [dragItem]
        
    }
}

extension Stage3ViewController: UIDragInteractionDelegate{
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        if let imageView = interaction.view as? UIImageView{
            guard let image = imageView.image else {return []}
            let provider = NSItemProvider(object: image)
            let item = UIDragItem.init(itemProvider: provider)
            return[item]
        }
        return []
    }
}

extension Stage3ViewController : UIDropInteractionDelegate {
    //To Highlight whether the dragging item can drop in the specific area
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal{
        let location = session.location(in: self.view)
        let dropOperation: UIDropOperation?
        if session.canLoadObjects(ofClass: UIImage.self) {
            if  answer1.frame.contains(location) {
                dropOperation = .copy
                selectedIndex = 1
            } else if  answer2.frame.contains(location) {
                dropOperation = .copy
                selectedIndex = 2
                
            } else if  answer3.frame.contains(location) {
                dropOperation = .copy
                selectedIndex = 3
                
            } else if  answer4.frame.contains(location) {
                dropOperation = .copy
                selectedIndex = 4
                
            } else {
                dropOperation = .cancel
                selectedIndex = 0
            }
        } else {
            dropOperation = .cancel
            selectedIndex = 0
        }
        
        //reload collectionview
        optionChordCollectonView.reloadData()
        
        return UIDropProposal(operation: dropOperation!)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        if session.canLoadObjects(ofClass: UIImage.self) {
            session.loadObjects(ofClass: UIImage.self) { (items) in
                if let images = items as? [UIImage] {
                    switch self.selectedIndex{
                    
                    case 1 :
                        self.answer1.image = images.last
                        break
                        
                    case 2 :
                        self.answer2.image = images.last
                        break
                        
                    case 3 :
                        self.answer3.image = images.last
                        break
                        
                    case 4 :
                        self.answer4.image = images.last
                        break
                        
                        
                    default:
                        print("exit")
                    }
                    
                }
            }
        }
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidEnd session: UIDropSession){
        
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidEnter session: UIDropSession){
        
    }
}


