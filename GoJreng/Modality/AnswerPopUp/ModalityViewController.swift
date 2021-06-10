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
        

        // Do any additional setup after loading the view.
    }
    @IBAction func wrongContinueTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//dismiss on touch feature
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }

}
