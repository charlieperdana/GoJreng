//
//  ButtonCollectionViewCell.swift
//  GoJreng
//
//  Created by Dion Lamilga on 11/06/21.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static let identifier = "answerCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "ButtonCollectionViewCell", bundle: nil)
    }
}
