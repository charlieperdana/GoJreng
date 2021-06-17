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
    
   // let userDefaults = UserDefaults.standard
    
    let defaults = UserDefaults.standard
    
    
    var newHighScore: Int = 0
    
    let stage = [
        Stages(stageName: "Major/Minor Identification", stageState: .unlocked, question: [], questionNumber: 10, highScore: 900),
        Stages(stageName: "Chord Identification", stageState: .unlocked, question: [], questionNumber: 10, highScore: 0),
        Stages(stageName: "Chord Progession Indentification", stageState: .locked, question: [], questionNumber: 10, highScore: 200)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if defaults.bool(forKey: "First") == true{
//            print("second")
//
//
//
//            defaults.set(true, forKey: "First")
//        } else {
//            print("First")
//
//            defaults.set(true, forKey: "First")
//
//            defaults.set(0, forKey: "highS")
//        }
        
        setupStackView()

        stageCollection.dataSource = self
        stageCollection.delegate = self
        
       // stage[1].highScore = newHighScore
        
        stageCollection.register(UnlockCollectionViewCell.nib(), forCellWithReuseIdentifier: UnlockCollectionViewCell.identifier)
        stageCollection.register(LockCollectionViewCell.nib(), forCellWithReuseIdentifier: LockCollectionViewCell.identifier)
        let hScore = defaults.integer(forKey: "hS")
        
        testLabel.text = "\(hScore)"
        
        
        //stageCollection.reloadData()
    }
    
    func setupStackView() {
        view.addSubview(stackViewHome)
        stackViewHome.setCustomSpacing(72, after: logoImage)
        
        setupCollectionViewAutolayout()
    }
    
    func setupCollectionViewAutolayout() {
        
        if let collectionViewLayout = stageCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UnlockCollectionViewCell.identifier, for: indexPath) as! UnlockCollectionViewCell
            
            cell.titleLabel.text = stage[indexPath.row].stageName
            cell.scoreLabel.text = "\(stage[indexPath.row].highScore ?? 0)"
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
                
                
                cell.scoreLabel.text = "\(defaults.value(forKey: "hS") ?? 0)"
              //  defaults.set(cell.scoreLabel.text, forKey: "hS")
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
            print("\(indexPath.row)")
        } else if indexPath.row == 1{
            showStage2()
        }
    }
    
    func showStage2(){
        let modalstoryboard = UIStoryboard(name: "SecondStage", bundle: nil)
        let vc = modalstoryboard.instantiateViewController(identifier: "secondStage") as! SecondStageViewController
        vc.highScore = newHighScore
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
}
