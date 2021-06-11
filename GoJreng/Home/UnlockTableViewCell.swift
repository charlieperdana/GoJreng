//
//  UnlockTableViewCell.swift
//  GoJreng
//
//  Created by Dion Lamilga on 08/06/21.
//

import UIKit

class UnlockTableViewCell: UITableViewCell {

    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var badgeImage: UIImageView!
    @IBOutlet weak var playImage: UIImageView!
    @IBOutlet weak var scoreImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    static let identifier = "unlockCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "UnlockTableViewCell", bundle: nil)
    }
}
