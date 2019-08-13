//
//  ViewController.swift
//  SwiftCollectionInTableView
//
//  Created by Preuttipan Janpen on 13/8/2562 BE.
//  Copyright © 2562 preuttipan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewList: UITableView!
    
    var storedOffsets = [Int: CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableViewList.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        
        cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        cell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? TableViewCell else { return }
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath.item)")
    }
}
