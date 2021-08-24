//
//  SupermarkProductParser.swift
//  Supermarket
//
//  Created by Adi Mizrahi on 09/08/2021.
//

import Foundation
class SupermarketProductParser {
    static func parse(_ message: Any?) -> SuperMarketProduct? {
        guard let message = message else {
            return nil
        }
        let stringMessage = "\(message)"
        guard let json = convertToDictionary(text: stringMessage), let name = json[supermarketFields.name] as? String, let color = json[supermarketFields.color] as? String, let weight = json[supermarketFields.weight] as? String else {
            return nil
        }
        return SuperMarkProductBuilder().set(name: name).set(color: color).set(weight: weight).build()//SuperMarketProduct(name: name, color: color, weight: weight)
    }
    private static func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
