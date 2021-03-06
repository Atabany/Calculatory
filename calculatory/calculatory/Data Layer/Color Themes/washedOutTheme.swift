//
//  washedOutTheme.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 28/05/2022.
//

import Foundation


extension ThemeManager {
    
    var washedOutTheme: CalculatorTheme {
        return CalculatorTheme(
            id: "10 ",
            backgroundColor:                "#ECF5FF",
            displayColor:                   "#0D2A4B",
                               
            extraFunctionColor:             "#A3CFF9",
            extraFunctionTitleColor:        "#5487BA",
                               
            operationColor:                 "#A3CFF9",
            operationTitleColor:            "#5487BA",
                               
            pinpadColor:                    "#1D1D1D",
            pinpadTitleColor:               "#FFFFFF",
            
            statusBarStyle: .dark
        )
    }
}
