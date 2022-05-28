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
    private var savedThemeIndex = 0

    private(set) var themes: [CalculatorTheme] = []
    
    private var savedTheme: CalculatorTheme? {
        return themes[savedThemeIndex]
    }
    
    
    var currentTheme: CalculatorTheme {
        guard let savedTheme = savedTheme else {
            return themes.first ?? darkTheme
        }
        return savedTheme
    }
    
    
    
    // MARK: - life Cycle
    
    private init () {
        populateArrayOfThemes()
        restoreSavedThemeIndex()
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
    
    
    
    
    // MARK: - Save & Restore To Disk
    private func restoreSavedThemeIndex() {
        if let previousThemeIndex = UserDefaults.standard.object(forKey: "mohamedElatabany.com.calcu.ThemeManager.ThemeIndex") as? Int {
            savedThemeIndex  = previousThemeIndex
        }
        
    }
    
    
    private func saveThemeIndexToDisk() {
        UserDefaults.standard.set(savedThemeIndex, forKey: "mohamedElatabany.com.calcu.ThemeManager.ThemeIndex")
        UserDefaults.standard.synchronize()
    }

    
    
    // MARK: - Next Theme
    
    func moveToNextTheme() {
        savedThemeIndex += 1
        if savedThemeIndex > themes.count - 1 {
            savedThemeIndex = 0
        }
        saveThemeIndexToDisk()
    }
    
}
