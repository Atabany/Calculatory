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
    
    
    // MARK: - Themes
    
    private(set) var themes: [CalculatorTheme] = []
    private var savedTheme: CalculatorTheme?
    
    
    var currentTheme: CalculatorTheme {
        guard let savedTheme = savedTheme else {
            return themes.first ?? darkTheme
        }
        return savedTheme
    }
    
    
    
    // MARK: - life Cycle
    
    private init () {
        populateArrayOfThemes()
    }
    
    
    private func populateArrayOfThemes() {
        themes = [
            darkTheme,
            purpleTheme,
            bloodOrangeTheme,
            lightBlueTheme,
            electroTheme,
            lightTheme,
            darkBlueTheme,
            orangeTheme,
            pinkTheme,
            washedOutTheme
        ]
    }
    
    
    // MARK: - Next Theme

    
    func moveToNextTheme() {
        
        let indexTheme = themes.firstIndex { theme in
            theme.id == currentTheme.id
        }

        guard var index = indexTheme else {return}
        
        index += 1
        
        if index > themes.count - 1 {
            index = 0
        }
        
        
        savedTheme = themes[index]
        
    }
    
}
