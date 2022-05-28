//
//  darkBlueTheme.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 28/05/2022.
//

import Foundation


extension ThemeManager {
    
    var darkBlueTheme: CalculatorTheme {
        return CalculatorTheme(
            id: "3",
            backgroundColor:                "#1D1D1D",
            displayColor:                   "#727272",
                               
            extraFunctionColor:             "#323232",
            extraFunctionTitleColor:        "#FFFFFF",
                               
            operationColor:                 "#4566B6",
            operationTitleColor:            "#FFFFFF",
                               
            pinpadColor:                    "#1D1D1D",
            pinpadTitleColor:               "#767676",
            
            statusBarStyle: .light
        )
    }
}
