//
//  SuperMarketProductBuilder.swift
//  Supermarket
//
//  Created by Adi Mizrahi on 09/08/2021.
//

import Foundation
class SuperMarkProductBuilder {
    var product: SuperMarketProduct
    
    init() {
        self.product = SuperMarketProduct()
    }
    
    func set(name: String) -> SuperMarkProductBuilder {
        product.name = name
        return self
    }
    
    func set(color: String) -> SuperMarkProductBuilder {
        product.color = color
        return self
    }
    
    func set(weight: String) -> SuperMarkProductBuilder {
        product.weight = weight
        return self
    }
    
    func build() -> SuperMarketProduct {
        return product
    }
}
