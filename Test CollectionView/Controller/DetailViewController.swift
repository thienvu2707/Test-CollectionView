//
//  DetailViewController.swift
//  Test CollectionView
//
//  Created by Thien Vu Le on Jun/28/18.
//  Copyright © 2018 Thien Vu Le. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  
  @IBOutlet weak var labelTitle: UILabel!
  @IBOutlet weak var textField: UITextField!
  var titleTf                  = ""
  override func viewDidLoad() {
    super.viewDidLoad()
    self.labelTitle.text = titleTf
  }

  @IBAction func buttonChangeName(_ sender: UIButton) {
    
  }
}
