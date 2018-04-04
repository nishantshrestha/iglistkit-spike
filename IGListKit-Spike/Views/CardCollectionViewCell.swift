//
//  CardCollectionViewCell.swift
//  IGListKitExamples
//
//  Created by Nishant Shrestha on 4/4/18.
//  Copyright © 2018 Instagram. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var actionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func actionButtonPressed(_ sender: Any) {
        print("do something")
    }
}
