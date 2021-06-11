//
//  Mode1ViewController.swift
//  GoJreng
//
//  Created by Alif Mahardhika on 11/06/21.
//

import UIKit

class Mode1ViewController: UIViewController {

    @IBOutlet weak var majorButton: UIButton!
    @IBOutlet weak var minorButton: UIButton!
    @IBOutlet var lifePicks: [UIImageView]!
    
    var lifeCount = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.majorButton.layer.cornerRadius = 10
        self.majorButton.clipsToBounds = true
        self.minorButton.layer.cornerRadius = 10
        self.minorButton.clipsToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func minorTouched(_ sender: Any) {
        if (lifeCount <= 0){
//            TODO handle game over
            print("gemover!!")
            return
        }
        lifePicks[lifeCount-1].isHidden = true
        lifeCount -= 1
    }
    
}
