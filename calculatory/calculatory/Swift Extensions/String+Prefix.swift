//
//  String+Prefix.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 24/05/2022.
//

import Foundation


extension String {
    
    mutating func addPrefixIfNeeded(_ prefix: String) {
        guard !hasPrefix(prefix) else {return}
        self = prefix + self
    }


    mutating func removePrefixIfNeeded(_ prefix: String) {
        guard hasPrefix(prefix) else { return }
        self = replacingOccurrences(of: prefix, with: "")
//        self = String(self.dropFirst(prefix.count)) 
    }
    
}
