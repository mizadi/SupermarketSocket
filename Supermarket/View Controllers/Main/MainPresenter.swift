//
//  MainPresenter.swift
//  Supermarket
//
//  Created by Adi Mizrahi on 09/08/2021.
//

import Foundation
protocol MainPresenterDelegate {
    func productRecevied(product: SuperMarketProduct)
    func failedToFetchProducts()
}

class MainPresenter {
    
    var delegate: MainPresenterDelegate
    
    var socketHelper: SocketHelper!
    
    init(_ delegate: MainPresenterDelegate) {
        self.delegate = delegate
    }
    
    func initSocket() {
        socketHelper = SocketHelper()
        socketHelper.delegate = self
        socketHelper.initSocket()
    }
}
extension MainPresenter: SuperMarketSocketDelegate {
    func productRecevied(product: SuperMarketProduct) {
        delegate.productRecevied(product: product)
    }
    
    func socketFailed() {
        delegate.failedToFetchProducts()
    }
    
    
}
