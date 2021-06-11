//
//  HomePageViewController.swift
//  GoJreng
//
//  Created by Dion Lamilga on 10/06/21.
//

import UIKit

class HomePageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var stageCollection: UICollectionView!
    
    let stage = [
        Stages(stageName: "Mayor/Minor Identification", stageState: .unlocked, question: [], questionNumber: 100, highScore: 900),
        Stages(stageName: "Chord Identification", stageState: .locked, question: [], questionNumber: 100, highScore: 0),
        Stages(stageName: "Chord Progession Indentification", stageState: .locked, question: [], questionNumber: 100, highScore: 0)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stageCollection.dataSource = self
        stageCollection.delegate = self
        
     //   let layout = self.stageCollection.collectionViewLayout as! UICollectionViewFlowLayout
        
        stageCollection.register(UnlockCollectionViewCell.nib(), forCellWithReuseIdentifier: UnlockCollectionViewCell.identifier)
        stageCollection.register(LockCollectionViewCell.nib(), forCellWithReuseIdentifier: LockCollectionViewCell.identifier)
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UnlockCollectionViewCell.identifier, for: indexPath) as! UnlockCollectionViewCell
            
            cell.titleLabel.text = stage[indexPath.row].stageName
            cell.scoreLabel.text = "\(stage[indexPath.row].highScore)"
            cell.layer.cornerRadius = 14
            
            return cell
        }
        
        if indexPath.row == 1{
            if stage[indexPath.row].stageState == StageState.locked{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LockCollectionViewCell.identifier, for: indexPath) as! LockCollectionViewCell
                
                cell.layer.cornerRadius = 14
                cell.bgImage.image = stage[indexPath.row].stageState?.getBackground()
                cell.lockImage.image = stage[indexPath.row].stageState?.getIcon()
                cell.titleLabel.text = stage[indexPath.row].stageName
                return cell
            }
            else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UnlockCollectionViewCell.identifier, for: indexPath) as! UnlockCollectionViewCell
                
                cell.layer.cornerRadius = 14
                cell.titleLabel.text = stage[indexPath.row].stageName
                cell.scoreLabel.text = "\(stage[indexPath.row].highScore)"
                return cell
            }
                
        }
        
        if indexPath.row == 2{
            if stage[indexPath.row].stageState == StageState.locked{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LockCollectionViewCell.identifier, for: indexPath) as! LockCollectionViewCell
                
                cell.layer.cornerRadius = 14
                cell.bgImage.image = stage[indexPath.row].stageState?.getBackground()
                cell.lockImage.image = stage[indexPath.row].stageState?.getIcon()
                cell.titleLabel.text = stage[indexPath.row].stageName
                return cell
            }
            else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UnlockCollectionViewCell.identifier, for: indexPath) as! UnlockCollectionViewCell
                
                cell.layer.cornerRadius = 14
                cell.titleLabel.text = stage[indexPath.row].stageName
                cell.scoreLabel.text = "\(stage[indexPath.row].highScore)"
                return cell
            }
        }
        
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
}
