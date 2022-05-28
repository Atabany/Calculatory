//
//  bloodOrangeTheme.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 28/05/2022.
//

import Foundation


extension ThemeManager {
    
    var bloodOrangeTheme: CalculatorTheme {
        return CalculatorTheme(
            backgroundColor:                "#4A1D41",
            displayColor:                   "#FFFFFF",
                               
            extraFunctionColor:             "#9C3766",
            extraFunctionTitleColor:        "#FFFFFF",
                               
            operationColor:                 "#8D3362",
            operationTitleColor:            "#FFFFFF",
                               
            pinpadColor:                    "#C64661",
            pinpadTitleColor:               "#FFFFFF",
            
            statusBarStyle: .light
        )
    }
}
