//
//  SocketHelper.swift
//  Supermarket
//
//  Created by Adi Mizrahi on 09/08/2021.
//

import Foundation
import SocketRocket

protocol SuperMarketSocketDelegate: AnyObject {
    func productRecevied(product: SuperMarketProduct)
    func socketFailed()
}

class SocketHelper: NSObject, SRWebSocketDelegate {
    var socket: SRWebSocket!
    
    unowned var delegate: SuperMarketSocketDelegate?
    
    func initSocket() {
        let urlRequest = URLRequest(url: URL(string: Utils.socketUrl)!)
        socket = SRWebSocket(urlRequest: urlRequest)
        socket.delegate = self
        socket.open()
        
    }
    
    func webSocket(_ webSocket: SRWebSocket!, didReceiveMessage message: Any!) {
        guard let message = message else {
            return
        }
        if let product = SupermarketProductParser.parse(message) {
            delegate?.productRecevied(product: product)
        }
    }
    
    func webSocket(_ webSocket: SRWebSocket!, didFailWithError error: Error!) {
        delegate?.socketFailed()
    }
}
