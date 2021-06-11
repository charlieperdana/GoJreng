//
//  SecondStageViewController.swift
//  GoJreng
//
//  Created by Dion Lamilga on 11/06/21.
//

import UIKit

class SecondStageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var indikatorCollection: UICollectionView!
    @IBOutlet weak var scoreImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var pick1Image: UIImageView!
    @IBOutlet weak var pick2Image: UIImageView!
    @IBOutlet weak var pick3Image: UIImageView!
    @IBOutlet weak var exitImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var playImage: UIImageView!
    @IBOutlet weak var remainingLabel: UILabel!
    @IBOutlet weak var answerCollection: UICollectionView!
    @IBOutlet weak var checkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        indikatorCollection.dataSource = self
        indikatorCollection.delegate = self
        
        answerCollection.dataSource = self
        answerCollection.dataSource = self
        
        indikatorCollection.tag = 1
        answerCollection.tag = 2
        
        answerCollection.register(ButtonCollectionViewCell.nib(), forCellWithReuseIdentifier: ButtonCollectionViewCell.identifier)
        
        checkButton.layer.cornerRadius = 14
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag{
        case 1:
            return 10
        
        case 2:
            return 4
            
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.layer.cornerRadius = 4
            return cell
            
        case 2:
            if indexPath.row == 0{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCollectionViewCell.identifier, for: indexPath) as! ButtonCollectionViewCell
                cell.answerLabel.text = "Am"
                cell.layer.cornerRadius = 8
                return cell
            }
            if indexPath.row == 1{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCollectionViewCell.identifier, for: indexPath) as! ButtonCollectionViewCell
                cell.answerLabel.text = "C"
                cell.layer.cornerRadius = 8
                return cell
            }
            if indexPath.row == 2{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCollectionViewCell.identifier, for: indexPath) as! ButtonCollectionViewCell
                cell.answerLabel.text = "B"
                cell.layer.cornerRadius = 8
                return cell
            }
            if indexPath.row == 3{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCollectionViewCell.identifier, for: indexPath) as! ButtonCollectionViewCell
                cell.answerLabel.text = "G"
                cell.layer.cornerRadius = 8
                return cell
            }
            else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                return cell
            }
        
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }
    }

}
