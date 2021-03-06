//
//  purpleTheme.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 28/05/2022.
//

import Foundation


extension ThemeManager {
    
    var purpleTheme: CalculatorTheme {
        return CalculatorTheme(
            id: "9",
            backgroundColor:                "#F4F5FA",
            displayColor:                   "#1D1D1D",
                               
            extraFunctionColor:             "#F4F5FA",
            extraFunctionTitleColor:        "#7550FE",
                               
            operationColor:                 "#7550FE",
            operationTitleColor:            "#FFFFFF",
                               
            pinpadColor:                    "#1D1D1D",
            pinpadTitleColor:               "#FFFFFF",
            
            statusBarStyle: .dark
        )
    }
}
