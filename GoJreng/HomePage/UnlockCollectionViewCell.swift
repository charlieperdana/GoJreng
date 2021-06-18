//
//  UnlockCollectionViewCell.swift
//  GoJreng
//
//  Created by Dion Lamilga on 10/06/21.
//

import UIKit

class UnlockCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var unlockCellWrapper: UIView!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreImage: UIImageView!
    @IBOutlet weak var badgeImage: UIImageView!
    
    
    static let identifier = "unlockCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "UnlockCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        
        //BUAT AUTORESIZE LABEL - NETTA
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.4
        titleLabel.numberOfLines = 2
    }
}
