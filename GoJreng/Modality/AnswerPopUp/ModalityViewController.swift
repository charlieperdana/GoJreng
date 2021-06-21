//
//  ModalityViewController.swift
//  GoJreng
//
//  Created by Alif Mahardhika on 10/06/21.
//

import UIKit

protocol ModalityViewControllerDelegate: AnyObject {
    func toHome(authorized: Bool)
    func didUpdatePlaceholder()
    //func stage3ToHome(authorized: Bool)
}

class ModalityViewController: UIViewController {
    
    @IBOutlet weak var wrongContinueButton: UIButton!
    @IBOutlet weak var correctAnswerBg: UIView!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    var text: String?
    
    var indexQuestion = 0
    
    var delegate: ModalityViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.wrongContinueButton.titleLabel?.text == "Continue"{
            self.wrongContinueButton.layer.cornerRadius = 10
            self.wrongContinueButton.clipsToBounds = true
            self.correctAnswerBg.layer.cornerRadius = 10
            self.correctAnswerBg.clipsToBounds = true
            self.delegate?.toHome(authorized: self.indexQuestion == 8 ? true : false)
            self.delegate?.didUpdatePlaceholder()
        }
        else{
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
                self.dismiss(animated: true) {
                    self.delegate?.toHome(authorized: self.indexQuestion == 9 ? true : false)
                    //self.delegate?.stage3ToHome(authorized: self.)
                    self.delegate?.didUpdatePlaceholder()
                }
            }
        }
        
        if text != nil {
            correctAnswerLabel.text = text
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func wrongContinueTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        print("Index Question di mvc : ",indexQuestion)
        self.delegate?.toHome(authorized: self.indexQuestion == 9 ? true : false)
        
    }
    
    
    //dismiss on touch feature
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
}
