//
//  ThemeManager.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 28/05/2022.
//

import Foundation



class ThemeManager {
    
    
    
    // MARK: -  Singleton
    
    static let shared = ThemeManager()
    private init () {
        populateArrayOfThemes()
    }

    
    // MARK: - Themes
    
    private(set) var themes: [CalculatorTheme] = []
    private var savedTheme: CalculatorTheme? {
        get {
            return darkTheme
        }
        
        set {
            savedTheme = darkTheme
        }
    }
    
    var currentTheme: CalculatorTheme {
        guard let savedTheme = savedTheme else {
            return themes.first ?? darkTheme
        }
        return savedTheme
    }
    

    private func populateArrayOfThemes() {
        themes = [
            darkTheme,
            purpleTheme,
            bloodOrangeTheme,
            darkTheme,
            electroTheme,
            lightTheme,
            lightTheme,
            orangeTheme,
            pinkTheme,
            washedOutTheme
        ]
    }
    
}
