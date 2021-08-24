//
//  SuperMarketProduct.swift
//  Supermarket
//
//  Created by Adi Mizrahi on 09/08/2021.
//

import Foundation
class SuperMarketProduct {
    var name: String
    var color: String
    var weight: String
    
    init() {
        self.name = ""
        self.color = ""
        self.weight = ""
    }
    
    init(name: String, color: String, weight: String){
        self.name = name
        self.color = color
        self.weight = weight
    }
}

struct supermarketFields {
    static let name = "name"
    static let color = "bagColor"
    static let weight = "weight"
}
