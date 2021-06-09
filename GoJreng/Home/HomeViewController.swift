//
//  HomeViewController.swift
//  GoJreng
//
//  Created by charlie siagian on 04/06/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Nilai Gojreng!", message: "Apakah GoJreng aplikasi terbaik di dunia?", preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Ya", style: .default){ _ in
            print("Gojreng Terbaik.")})
        
        alert.addAction(UIAlertAction(title: "Tidak", style: .cancel){ _ in
            print("Gojreng biasa aja.")
        })
        
        self.present(alert, animated: true)
    }
    
    
}
