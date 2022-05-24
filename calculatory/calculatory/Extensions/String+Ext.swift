//
//  String+Ext.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 24/05/2022.
//

import Foundation

extension String {
    
    
    mutating func convertToDecimal() -> Decimal? {
        self = self.replacingOccurrences(of: Locale.current.groupingSeparator ?? "," , with: "")

        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        guard let convertedNumber = formatter.number(from: self) else {return .zero}
        return convertedNumber.decimalValue        
    }
    
    
    
}
