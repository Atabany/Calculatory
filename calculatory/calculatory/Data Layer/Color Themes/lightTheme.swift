//
//  lightTheme.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 28/05/2022.
//

import Foundation


extension ThemeManager {
    
    var lightTheme: CalculatorTheme {
        return CalculatorTheme(
            id: "6",
            backgroundColor:                "#F6F8F9",
            displayColor:                   "#000000",
                               
            extraFunctionColor:             "#E9F0F4",
            extraFunctionTitleColor:        "#4BE6A9",
                               
            operationColor:                 "#4BE6A9",
            operationTitleColor:            "#14145C",
                               
            pinpadColor:                    "#E9F0F4",
            pinpadTitleColor:               "#000000",
            
            statusBarStyle: .dark
        )
    }
}
