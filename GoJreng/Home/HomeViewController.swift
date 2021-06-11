//
//  HomeViewController.swift
//  GoJreng
//
//  Created by charlie siagian on 04/06/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stageTable: UITableView!
    
    @IBOutlet weak var closeBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stageTable.dataSource = self
        stageTable.delegate = self

        
        stageTable.register(UnlockTableViewCell.nib(), forCellReuseIdentifier: UnlockTableViewCell.identifier)
        stageTable.register(LockedTableViewCell.nib(), forCellReuseIdentifier: LockedTableViewCell.identifier)
        // Do any additional setup after loading the view.
        
        //tabelview style
        stageTable.separatorStyle = .none
        stageTable.showsVerticalScrollIndicator = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: LockedTableViewCell.identifier, for: indexPath) as! LockedTableViewCell
            //cell.testLabel.text = "Jancuk"
            return cell
        }
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: UnlockTableViewCell.identifier, for: indexPath) as! UnlockTableViewCell
            
            cell.layer.cornerRadius = 14
            //cell.testLabel.text = "Jancuk"
            return cell
        }
         else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
         }
    }
    
    
    @IBAction func exitModal(_ sender: UIButton) {
        showExitModal()
    }
    
    
    @objc func showExitModal() {
        print("exit tapped")
        let exitModality = ExitOverlayView()
        exitModality.modalPresentationStyle = .custom
        exitModality.transitioningDelegate = self
        self.present(exitModality, animated: true, completion: nil)

    }
    
    
}

extension HomeViewController : UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        ExitPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
