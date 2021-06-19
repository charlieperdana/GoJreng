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
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var stackViewHome: UIStackView!
    
    @IBOutlet weak var testLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    
    var newHighScore2: Int = 0
    var newHighScore1: Int = 0
    
    let stage = [
        Stages(stageName: "Major/Minor Identification", stageState: .unlocked, question: [], questionNumber: 10, highScore: 900),
        Stages(stageName: "Chord Identification", stageState: .locked, question: [], questionNumber: 10, highScore: 0),
        Stages(stageName: "Chord Progression Identification", stageState: .locked, question: [], questionNumber: 10, highScore: 200)
    ]



    override func viewDidLoad() {
        super.viewDidLoad()
        HomeHelper.checkHSinited()

        stageCollection.dataSource = self
        stageCollection.delegate = self
        
        stageCollection.register(UnlockCollectionViewCell.nib(), forCellWithReuseIdentifier: UnlockCollectionViewCell.identifier)
        stageCollection.register(LockCollectionViewCell.nib(), forCellWithReuseIdentifier: LockCollectionViewCell.identifier)
        
        //unlock stage 2
        if defaults.value(forKey: "hS1") as! Int >= 1400  {
          stage[1].stageState = .unlocked
        }

        //unlock stage 3
        //        if (defaults.value(forKey: "hS2") ?? 0) as! String != nil && Int((defaults.value(forKey: "hS2") ?? 0) as! String) ?? 0 == 1000 {
        //           stage[2].stageState = .unlocked
        //        }

        
        stageCollection.reloadData()
    }



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UnlockCollectionViewCell.identifier, for: indexPath) as! UnlockCollectionViewCell
            
            cell.titleLabel.text = stage[indexPath.row].stageName
            cell.scoreLabel.text = "\(defaults.integer(forKey: "hS1"))"
            

            if defaults.value(forKey: "hS1") as! Int >= 2400{
                cell.badgeImage.image = #imageLiteral(resourceName: "goldBadge")
            } else if (defaults.value(forKey: "hS1") as! Int >= 1500){
                cell.badgeImage.image = #imageLiteral(resourceName: "silverBadge")
            }
            
            return cell
        }
        
        if indexPath.row == 1 {
            if stage[indexPath.row].stageState == StageState.locked{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LockCollectionViewCell.identifier, for: indexPath) as! LockCollectionViewCell

                cell.bgImage.image = stage[indexPath.row].stageState?.getBackground()
                cell.lockImage.image = stage[indexPath.row].stageState?.getIcon()
                cell.titleLabel.text = stage[indexPath.row].stageName
                cell.isUserInteractionEnabled = false
                return cell
            }
            
            else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UnlockCollectionViewCell.identifier, for: indexPath) as! UnlockCollectionViewCell
                cell.titleLabel.text = stage[indexPath.row].stageName
                cell.scoreLabel.text = "\(defaults.value(forKey: "hS2") ?? 0)"
                if cell.scoreLabel.text == "1000"{
                    cell.badgeImage.image = #imageLiteral(resourceName: "goldBadge")
                } else if cell.scoreLabel.text == "900" || cell.scoreLabel.text == "800"{
                    cell.badgeImage.image = #imageLiteral(resourceName: "silverBadge")
                }
                
                return cell
            }
                
        }
        
        if indexPath.row == 2{
            if stage[indexPath.row].stageState == StageState.locked{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LockCollectionViewCell.identifier, for: indexPath) as! LockCollectionViewCell

                cell.bgImage.image = stage[indexPath.row].stageState?.getBackground()
                cell.lockImage.image = stage[indexPath.row].stageState?.getIcon()
                cell.titleLabel.text = stage[indexPath.row].stageName
                return cell
            }
            else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UnlockCollectionViewCell.identifier, for: indexPath) as! UnlockCollectionViewCell

                cell.titleLabel.text = stage[indexPath.row].stageName
                cell.scoreLabel.text = "\(stage[indexPath.row].highScore ?? 0)"
                return cell
            }
        }
        
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
            //showStage1()
            PageHelper.showStage1(currentStoryBoard: self)
        } else if indexPath.row == 1{
            //showStage2()
            PageHelper.showStage2(currentStoryBoard: self)
        } else {
            PageHelper.showStage3()
        }
    }

}
