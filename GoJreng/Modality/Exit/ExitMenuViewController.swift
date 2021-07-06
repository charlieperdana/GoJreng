//
//  ExitMenuViewController.swift
//  GoJreng
//
//  Created by Alif Mahardhika on 21/06/21.
//

import UIKit

class ExitMenuViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var squareBackgroundThingy: UIView!

    var stage: Int?
    var currentVC1: Mode1ViewController?
    var currentVC3: Stage3ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.backButton.layer.cornerRadius = 10
        self.backButton.clipsToBounds = true
        self.exitButton.layer.cornerRadius = 10
        self.exitButton.clipsToBounds = true
        self.exitButton.layer.borderWidth = 1
        self.exitButton.layer.borderColor = GoJrengColors.Bone.cgColor
        self.squareBackgroundThingy.layer.cornerRadius = 10
        self.squareBackgroundThingy.clipsToBounds = true
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func exitButtonTapped(_ sender: Any) {

      self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
      PageHelper.showFeedback(stgPlayed: stage ?? 0, stgScore: 0 , currentStoryBoard: self)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
      if stage == 1 {
        currentVC1?.setTimer()
      }else if stage == 3 {
        //currentVC3?.
      }
      dismiss(animated: true, completion: nil)
    }
    
//dismiss on touch feature
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
