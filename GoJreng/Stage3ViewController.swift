//
//  Stage3ViewController.swift
//  GoJreng
//
//  Created by Novi Gunawan on 14/06/21.
//

import UIKit

class Stage3ViewController: UIViewController{
    
    @IBOutlet weak var timeLabel: UILabel!
    var currentQuestion: Questions?
    var seconds = 15
    var timer = Timer()
    var soundName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        //setBackground()
      
        guard let pathQuestionSound = Bundle.main.path(forResource: soundName, ofType: "mp3") else { return }
        let urlQuesetionSound = URL(fileURLWithPath: pathQuestionSound)
        
        
        //timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        
        //setupQuestions
        setUpQuestionsStage()
        
        
    }
    
    @objc func timerCounter() {
        seconds -= 1
        timeLabel.text = "\(seconds)"
        
        if (seconds==0){
            timer.invalidate()
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
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
}
extension Stage3ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        ExitPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

extension Stage3ViewController: UICollectionViewDelegate {
    
}

extension Stage3ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
