//
//  CustomCollectionViewCell.swift
//  Test CollectionView
//
//  Created by Thien Vu Le on Jun/26/18.
//  Copyright © 2018 Thien Vu Le. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
  
  weak var controller : ViewController!
    @IBOutlet weak var tbView: UITableView!
    var data : [String]! {
        didSet{
            tbView.dataSource = self
            tbView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tbView.estimatedRowHeight    = 200
        tbView.rowHeight             = UITableViewAutomaticDimension
        tbView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
}

extension CustomCollectionViewCell: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell          = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.controller   = controller
        cell.lbTitle.text = data[indexPath.row]
        return cell
    }
}

//extension CustomCollectionViewCell : UITableViewDelegate {
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    <#code#>
//  }
//}
