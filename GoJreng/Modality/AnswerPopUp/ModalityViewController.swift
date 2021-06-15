//
//  ModalityViewController.swift
//  GoJreng
//
//  Created by Alif Mahardhika on 10/06/21.
//

import UIKit

class ModalityViewController: UIViewController {

    @IBOutlet weak var wrongContinueButton: UIButton!
    @IBOutlet weak var correctAnswerBg: UIView!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.wrongContinueButton.titleLabel?.text == "Continue"{
            self.wrongContinueButton.layer.cornerRadius = 10
            self.wrongContinueButton.clipsToBounds = true
            self.correctAnswerBg.layer.cornerRadius = 10
            self.correctAnswerBg.clipsToBounds = true
        }
        else{
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        if text != nil {
            correctAnswerLabel.text = text
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func wrongContinueTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

//dismiss on touch feature
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }

}
