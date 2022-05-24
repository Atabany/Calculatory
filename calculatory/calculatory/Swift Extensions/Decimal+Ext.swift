//
//  Decimal+Ext.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 23/05/2022.
//

import Foundation

extension Decimal {
    func formatted() -> String {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        guard let formattedValue = formatter.string(from: self as NSNumber) else { return "" }
        return formattedValue
    }
}
