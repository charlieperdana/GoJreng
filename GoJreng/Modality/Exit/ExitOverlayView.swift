//
//  ExitOverlayView.swift
//  GoJreng
//
//  Created by charlie siagian on 10/06/21.
//

import UIKit

class ExitOverlayView: UIViewController {
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    var stagePlayed: Int?

    @IBOutlet weak var exitBtn: UIButton!{
        didSet{
            exitBtn.backgroundColor = .clear
            exitBtn.layer.cornerRadius = 10
            exitBtn.layer.borderWidth = 2
            exitBtn.layer.borderColor = #colorLiteral(red: 0.9058823529, green: 0.8549019608, blue: 0.768627451, alpha: 1)
        }
    }
    
    @IBOutlet weak var goBackBtn: UIButton!{
        didSet{
            goBackBtn.layer.cornerRadius = 10
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        setButtonView()
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // Not allowing the user to drag the view upward
        guard translation.y >= 0 else { return }
        
        // setting x as 0 because we don't want users to move the frame side ways!! Only want straight up or down
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
    
    func setButtonView() {
        exitBtn?.setTitle("Exit", for: .normal)
        goBackBtn?.setTitle("Go Back", for: .normal)
    }
    
    
    @IBAction func tapExit(_ sender: UIButton) {
      PageHelper.showHomePage(currentStoryBoard: self)
    }
    
    
    @IBAction func tapBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

