//
//  UnlockCollectionViewCell.swift
//  GoJreng
//
//  Created by Dion Lamilga on 10/06/21.
//

import UIKit

class UnlockCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreImage: UIImageView!
    @IBOutlet weak var bagdeImage: UIImageView!
    
    static let identifier = "unlockCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "UnlockCollectionViewCell", bundle: nil)
    }
}
