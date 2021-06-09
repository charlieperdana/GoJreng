//
//  LockedTableViewCell.swift
//  GoJreng
//
//  Created by Dion Lamilga on 08/06/21.
//

import UIKit

class LockedTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var bgImage: UIImageView!
    
    static let identifier = "lockCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "LockedTableViewCell", bundle: nil)
    }
}
