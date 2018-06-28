//
//  CustomTableViewCell.swift
//  Test CollectionView
//
//  Created by Thien Vu Le on Jun/26/18.
//  Copyright © 2018 Thien Vu Le. All rights reserved.
//

import UIKit

protocol ChangeName {
  func changeName(name: String)
}

class CustomTableViewCell: UITableViewCell {

  var changeNameDelegate: ChangeName?
  
    @IBOutlet weak var lbTitle: UILabel!
  weak var controller : ViewController!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
