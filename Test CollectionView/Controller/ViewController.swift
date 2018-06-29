//
//  ViewController.swift
//  Test CollectionView
//
//  Created by Thien Vu Le on Jun/26/18.
//  Copyright © 2018 Thien Vu Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var buttonContainer: UIView!
  @IBOutlet weak var labelTab1: UIButton!
  @IBOutlet weak var labelTab2: UIButton!
  var cellModified            = UITableViewCell()
  @IBOutlet var collectionView: UICollectionView!
  
  let detailViewController                = DetailViewController()
  let dataArray = ["aaa", "bbb", "ccc", "ddd", "eee", "fff", "ggg", "hhh", "iii", "jjj", "kkk", "lll", "mmm", "nnn", "ooo", "ppp", "qqq", "rrr", "sss", "ttt", "uuu", "vvv", "www", "xxx", "yyy", "zzz"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.register(UINib(nibName : "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier : "CustomCollectionViewCell")
    
    collectionView.contentInset           = UIEdgeInsetsMake(120, 0, 0, 0)
  }
  
  
  @IBAction func tab1(_ sender: UIButton) {
    
    let indexPath1                        = IndexPath(item: 0, section: 0)
    collectionView.scrollToItem(at: indexPath1, at: .right, animated: true)
    
    print("tab1")
    
  }
  
  @IBAction func tab2(_ sender: UIButton) {
    
    let indexPath                         = IndexPath(item: 1, section: 0)
    collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    print("tab2")
    
    
  }
}

//MARK: CollectionView Delegate and datasource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell        = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
    cell.controller = self
    cell.data       = dataArray
    
    return cell
  }
  
  func showDetail(detailDatashow: String, cell: UITableViewCell)  {
    cellModified = cell
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    vc.titleTf = detailDatashow
    self.navigationController?.pushViewController(vc, animated: true)
    
  }
  
}


// MARK: Collectionview Flow layout
extension ViewController: UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
}

extension ViewController{
  func changeData(textChanged: String){
    if let cell = cellModified as? CustomTableViewCell{
      cell.lbTitle.text = textChanged
    }
  }
}












