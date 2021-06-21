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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backButton.layer.cornerRadius = 10
        self.backButton.clipsToBounds = true
        self.exitButton.layer.cornerRadius = 10
        self.exitButton.clipsToBounds = true
        self.exitButton.layer.borderWidth = 1
        self.exitButton.layer.borderColor = GoJrengColors.Bone.cgColor
        

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
        let modalStoryBoard = UIStoryboard(name: "HomeP", bundle: nil)
        let vc = modalStoryBoard.instantiateViewController(identifier: "HomeView") as! HomePageViewController

        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
//dismiss on touch feature
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
