//
//  orangeTheme.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 28/05/2022.
//

import Foundation


extension CalculatorViewController {
    
    var orangeTheme: CalculatorTheme {
        return CalculatorTheme(
            backgroundColor:                "#DC6969",
            displayColor:                   "#FFFFFF",
                               
            extraFunctionColor:             "#D05353",
            extraFunctionTitleColor:        "#FFFFFF",
                               
            operationColor:                 "#CC4D4D",
            operationTitleColor:            "#FFFFFF",
                               
            pinpadColor:                    "#C94848",
            pinpadTitleColor:               "#FFFFFF",
            
            statusBarStyle: .light
        )
    }
}
