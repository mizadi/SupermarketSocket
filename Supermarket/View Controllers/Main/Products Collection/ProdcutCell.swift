//
//  ProdcutCell.swift
//  Supermarket
//
//  Created by Adi Mizrahi on 09/08/2021.
//

import Foundation
import UIKit
class ProdcutCell: UICollectionViewCell {
    @IBOutlet weak var vwBagColor: UIView!
    @IBOutlet weak var lbItem: UILabel!
    @IBOutlet weak var lbWeight: UILabel!
    
    override func prepareForReuse() {
        
    }
    
    
    func update(product: SuperMarketProduct) {
        lbItem.text = product.name
        lbWeight.text = product.weight
        vwBagColor.backgroundColor = UIColor(rgb: product.color.hexaToDecimal)
        self.contentView.layer.cornerRadius = 8.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    override func layoutSubviews() {
        
    }
}
