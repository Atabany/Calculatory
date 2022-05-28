//
//  lightBlueTheme.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 28/05/2022.
//

import Foundation


extension CalculatorViewController {
    
    var lightBlueTheme: CalculatorTheme {
        return CalculatorTheme(
            backgroundColor:                "#F8F8F8",
            displayColor:                   "#000000",
                               
            extraFunctionColor:             "#D6DEE5",
            extraFunctionTitleColor:        "#00B4FF",
                               
            operationColor:                 "#00B4FF",
            operationTitleColor:            "#FFFFFF",
                               
            pinpadColor:                    "#EEEEEE",
            pinpadTitleColor:               "#000000",
            
            statusBarStyle: .dark
        )
    }
}
