//
//  StringProtocol+Extension.swift
//  Supermarket
//
//  Created by Adi Mizrahi on 09/08/2021.
//

import Foundation
import UIKit
extension StringProtocol {
    func dropping<S: StringProtocol>(prefix: S) -> SubSequence { hasPrefix(prefix) ? dropFirst(prefix.count) : self[...] }
    var hexaToDecimal: Int { Int(dropping(prefix: "#"), radix: 16) ?? 0 }
}
