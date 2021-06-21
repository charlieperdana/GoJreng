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
    @IBOutlet weak var pageControlCollectonView: UICollectionView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    //var currentQuestion: Questions?
    var seconds = 30
    var timer = Timer()
    var currentQuestionIndex: Int = 0
//    var questionSoundsArray: [String] = []
    var score: Int = 0
    var highScore: Int = 0
    var answer: [Answers] = []
    var questionNumberForPageControl: [Int] = []
    var randomQuestionsArray: [Questions] = [Questions]()
    var index: [Int] = []
    var indexPath = IndexPath(row: 0, section: 0)
    var successDrop = false
    
    //answerPlaceholder
    @IBOutlet weak var answer1: UIImageView!
    @IBOutlet weak var answer2: UIImageView!
    @IBOutlet weak var answer3: UIImageView!
    @IBOutlet weak var answer4: UIImageView!
    
    //audio
    var questionSound: AVAudioPlayer!
    var timerSound: AVAudioPlayer!
    var correctSound: AVAudioPlayer!
    var wrongSound: AVAudioPlayer!
    
    
    
    var selectedIndex = 0
    var itemsChord : [String] = []
    var concateAnswer : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        //setupQuestions
        setUpQuestionsStage()
        
        randomQuestionsArray =
            questionsForStage3[0..<4].shuffled() +
            questionsForStage3[4..<7].shuffled() +
            questionsForStage3[7..<10].shuffled()

        //Set questions sounds
//        for i in 0..<(stage3.questionNumber) {
//            questionSoundsArray.append(questionsForStage3[i].questionSound)
//        }
        //Check Button is disabled at first
        checkButton.isEnabled = false
        checkButton.backgroundColor = #colorLiteral(red: 0.5803921569, green: 0.5529411765, blue: 0.5254901961, alpha: 1)
        checkButton.setTitleColor(#colorLiteral(red: 0.9058823529, green: 0.8549019608, blue: 0.768627451, alpha: 1), for: .disabled)
        
        
        //        itemsChord = [#imageLiteral(resourceName: "Em"),#imageLiteral(resourceName: "Dm"),#imageLiteral(resourceName: "G"),#imageLiteral(resourceName: "B"),#imageLiteral(resourceName: "A"),#imageLiteral(resourceName: "F"),#imageLiteral(resourceName: "C"),#imageLiteral(resourceName: "Am")]n
        
        answer = randomQuestionsArray[currentQuestionIndex].answer
        questionNumberForPageControl.append(currentQuestionIndex)
        updateQuestion()
        //        itemsChord = ["Em","Dm","G","B","A","F","C","Am"]
        optionChordCollectonView.dataSource = self
        optionChordCollectonView.delegate = self
        optionChordCollectonView.reloadData()
        self.setDragAndDropSettings()
        
        setOptionChordsCount(jumlah: answer.count-1)
        
    }
    
//    override func viewDidLayoutSubviews() {
//        print("This loaaad")
//    }
    
    func updateQuestion() {
        answer = randomQuestionsArray[currentQuestionIndex].answer
        seconds = 30
        concateAnswer = ""
        timeLabel.text = "\(seconds)"
        itemsChord = []
        for i in 0...(answer.count-2) {
            itemsChord.append(answer[i].answerLabel)
        }
        //        checkButton.isEnabled = false
        //        checkButton.backgroundColor = #colorLiteral(red: 0.5803921569, green: 0.5529411765, blue: 0.5254901961, alpha: 1)
        //        checkButton.setTitleColor(#colorLiteral(red: 0.9058823529, green: 0.8549019608, blue: 0.768627451, alpha: 1), for: .disabled)
        //        optionChordCollectonView.reloadData()
        pageControlCollectonView.reloadData()
        setOptionChordsCount(jumlah: answer.count-1)
    }
    
    func setOptionChordsCount(jumlah: Int) {
        answer1.isHidden = false
        answer2.isHidden = false
        answer3.isHidden = false
        answer4.isHidden = false
        
        
        if jumlah == 2 {
            answer1.isHidden = true
            answer4.isHidden = true
            
//            answer2.frame = CGRect(x: 113, y: 474, width: 72, height: 62)
//            answer3.frame = CGRect(x: 204, y: 474, width: 72, height: 62)
            
        } else if jumlah == 3 {
            answer3.isHidden = true
            
            
        }
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
        var isCorrect = checkAnswer()
        if(isCorrect){
            score+=100
            scoreLabel.text = "\(score)"
            showCorrectModal()
        }
        else {
            showWrongModal()
        }
        print("Current Question Index = \(currentQuestionIndex)")
        
        if currentQuestionIndex < randomQuestionsArray.count-1{
            currentQuestionIndex+=1
            questionNumberForPageControl.append(currentQuestionIndex)
            
            updateQuestion()
            print("Current question index setelah tap check button : \(currentQuestionIndex)")
        }
        
        else {
            showFeedback()
        }
        
        optionChordCollectonView.reloadData()
    }
    @objc func timerCounter() {
        seconds -= 1
        timeLabel.text = "\(seconds)"
        
        //Play sound effects of 10s timer
        if(seconds==5){
            guard let pathQuestionSound = Bundle.main.path(forResource: "timer 5s", ofType: "mp3") else {return}
            
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
            showWrongModal()
            
            if currentQuestionIndex < randomQuestionsArray.count-1{
                currentQuestionIndex+=1
                updateQuestion()
                print("Current question index setelah tap check button : \(currentQuestionIndex)")
            }
            
            else {
                print("Kalo current index udah 9, ini keprint")
                showFeedback()
                
                //showFeedback()
            }
            optionChordCollectonView.reloadData()
        }
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        playQuestionSound(questionSoundFileName: randomQuestionsArray[currentQuestionIndex].questionSound)
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
        if questionSound != nil {
            questionSound.pause()
        }
        
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
    
    func checkAnswer() -> Bool {
        var finalAnswer = concateAnswer.dropLast(1)
        print(finalAnswer)
        if finalAnswer == answer[answer.count-1].answerLabel  {
            return true
        }
        else{
            return false
        }
        
    }
    
    func setPlaceholderDefault() {
        answer1.image = UIImage(named: "answerPlaceholder3")
        answer2.image = UIImage(named: "answerPlaceholder3")
        answer3.image = UIImage(named: "answerPlaceholder3")
        answer4.image = UIImage(named: "answerPlaceholder3")
        print("placeholder berhasil diset")
    }
    func goToHome() {
        
        let homeStoryboard = UIStoryboard(name: "HomeP", bundle: nil)
        let hc = homeStoryboard.instantiateViewController(identifier: "HomeView") as! HomePageViewController
        self.present(hc, animated: true)
        
    }
    func showFeedback() {
        
        let feedbackStoryboard = UIStoryboard(name: "FeedbackPage", bundle: nil)
        let fc = feedbackStoryboard.instantiateViewController(identifier: "feedbackPage") as! FeedbackPageViewController
        print(score)
        fc.stageScore = score
        fc.modalPresentationStyle = .overFullScreen
        fc.modalTransitionStyle = .crossDissolve
        self.present(fc, animated: true)
    }
    
    func showCorrectModal() {
        let modalStoryboard = UIStoryboard(name: "BaseModality", bundle: nil)
        let vc = modalStoryboard.instantiateViewController(identifier: "correct") as! ModalityViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.indexQuestion = currentQuestionIndex
        vc.delegate = self
        let controller = ModalityViewController()
        controller.delegate = self
        present(vc, animated: true)
        
        //Audio
        guard let pathCorrectSound = Bundle.main.path(forResource: "correctAnswer", ofType: "mp3") else {return}
        
        let urlCorrectSound = URL(fileURLWithPath: pathCorrectSound ?? "")
        do {
            correctSound = try AVAudioPlayer(contentsOf: urlCorrectSound)
            correctSound.volume = 2
            correctSound.play()
        }
        catch {
            print(error)
        }
        
    }
    
    func showWrongModal() {
        let modalStoryboard = UIStoryboard(name: "BaseModality", bundle: nil)
        let vc = modalStoryboard.instantiateViewController(identifier: "wrong") as! ModalityViewController
        vc.text = answer[answer.count-1].answerLabel
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.indexQuestion = currentQuestionIndex
        vc.delegate = self
        let controller = ModalityViewController()
        controller.delegate = self
        present(vc, animated: true)
        
        //Audio
        guard let pathWrongSound = Bundle.main.path(forResource: "wrongAnswer", ofType: "mp3") else {return}
        
        let urlWrongSound = URL(fileURLWithPath: pathWrongSound ?? "")
        do {
            wrongSound = try AVAudioPlayer(contentsOf: urlWrongSound)
            wrongSound.volume = 2
            wrongSound.play()
        }
        catch {
            print(error)
        }
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
}
extension Stage3ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        ExitPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

extension Stage3ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDragDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collectionView == self.optionChordCollectonView ? itemsChord.count : 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.optionChordCollectonView {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:"answerCell", for: indexPath) as! AnswersCollectionVC
            //        cell.imageOptionChord.image = itemsChord[indexPath.row]
            cell.imageOptionChord.image = UIImage(named: "\(itemsChord[indexPath.row])")
            return cell
        }
        //Collection View For Page Control
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pageControlCell", for: indexPath)
            
            if questionNumberForPageControl.contains(indexPath.row) {
                cell.backgroundColor =  #colorLiteral(red: 0.6327156425, green: 0.3489228785, blue: 0.09062369913, alpha: 1)
            } else {
                cell.backgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            
            return cell
        }
        
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
        itemsChord[indexPath.row] = "noChord"
        
        //change the cell after drag
        if successDrop == true {
//            itemsChord[indexPath.row] = "noChord"
//            self.concateAnswer += "\(itemsChord[indexPath.row])-"
        }
        
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
                successDrop = true
            } else if  answer2.frame.contains(location) {
                dropOperation = .copy
                selectedIndex = 2
                successDrop = true
            } else if  answer3.frame.contains(location) {
                dropOperation = .copy
                selectedIndex = 3
                successDrop = true
            } else if  answer4.frame.contains(location) {
                dropOperation = .copy
                selectedIndex = 4
                successDrop = true
            } else {
                dropOperation = .cancel
                selectedIndex = 0
                successDrop = false
            }
        } else {
            dropOperation = .cancel
            selectedIndex = 0
            successDrop = false
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

extension Stage3ViewController: ModalityViewControllerDelegate {
    func didUpdatePlaceholder() {
        setPlaceholderDefault()
    }
    
    func toHome(authorized: Bool) {
        if authorized {
            //showHomePage()
            PageHelper.showFeedback(stgPlayed: 3, stgScore: score, currentStoryBoard: self)
        }
    }
}
