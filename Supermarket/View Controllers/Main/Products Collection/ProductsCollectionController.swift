//
//  ProductsCollectionController.swift
//  Supermarket
//
//  Created by Adi Mizrahi on 09/08/2021.
//

import Foundation
import UIKit
class ProductsCollectionController:NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var data: [SuperMarketProduct]
    
    init(data: [SuperMarketProduct]) {
        self.data = data
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProdcutCell
        cell.update(product: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var elemWidth: CGFloat = 0
        let count: CGFloat = 2
        let totalWidth = collectionView.frame.width
        elemWidth = /*max(collectionView.frame.size.width / 2 ,*/ totalWidth / count - (collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing - (collectionViewLayout as! UICollectionViewFlowLayout).sectionInset.right
        return CGSize(width: elemWidth, height: elemWidth)
    }
    
    func addProdcut(_ product: SuperMarketProduct) {
        data.insert(product, at: 0)
    }
    
}
