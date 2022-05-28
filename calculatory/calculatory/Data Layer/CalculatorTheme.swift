//
//  CalculatorTheme.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 21/05/2022.
//

import Foundation

enum StatusBarStyle {
    case light
    case dark
    
}


struct CalculatorTheme {
    
    // Main View
    let backgroundColor: String

    // LCDView
    let displayColor: String
    
    // ExtraTitle
    let extraFunctionColor: String
    let extraFunctionTitleColor: String

    // Operations
    let operationColor: String
    let operationTitleColor: String
    
    // PinPad
    let pinpadColor: String
    let pinpadTitleColor: String
    
    
    let statusBarStyle: StatusBarStyle 
    
    
}



