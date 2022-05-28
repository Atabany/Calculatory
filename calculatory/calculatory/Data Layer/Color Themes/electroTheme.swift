//
//  electroTheme.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 28/05/2022.
//

import Foundation


extension CalculatorViewController {
    
    var electroTheme: CalculatorTheme {
        return CalculatorTheme(
            backgroundColor:                "#0E0E41",
            displayColor:                   "#FFFFFF",
                               
            extraFunctionColor:             "#14145C",
            extraFunctionTitleColor:        "#4BE6A9",
                               
            operationColor:                 "#4BE6A9",
            operationTitleColor:            "#14145C",
                               
            pinpadColor:                    "#14145C",
            pinpadTitleColor:               "#FFFFFF",
            
            statusBarStyle: .light
        )
        
    }
}
