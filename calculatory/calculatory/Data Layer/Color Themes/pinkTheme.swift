//
//  pinkTheme.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 28/05/2022.
//

import Foundation


extension CalculatorViewController {
    
    var pinkTheme: CalculatorTheme {
        return CalculatorTheme(
            backgroundColor:                "#253C5B",
            displayColor:                   "#EBF0EF",
                               
            extraFunctionColor:             "#294666",
            extraFunctionTitleColor:        "#EBF0EF",
                               
            operationColor:                 "#FA569C",
            operationTitleColor:            "#EBF0EF",
                               
            pinpadColor:                    "#16253A",
            pinpadTitleColor:               "#EBF0EF",
            
            statusBarStyle: .light
        )
    }
}
