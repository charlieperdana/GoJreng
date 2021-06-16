//
//  LockCollectionViewCell.swift
//  GoJreng
//
//  Created by Dion Lamilga on 10/06/21.
//

import UIKit

class LockCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lockImage: UIImageView!
    
    static let identifier = "lockCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "LockCollectionViewCell", bundle: nil)
    }
}
