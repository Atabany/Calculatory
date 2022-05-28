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
    
    
    // MARK: - Data Storage
    private var dataStore: DataStoreProtocol?
    
    
    
    // MARK: - Themes
    private var savedThemeIndex = 0

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
        dataStore = DataStoreUserDefaultsManager(key: "mohamedElatabany.com.calcu.ThemeManager.ThemeIndex")
        populateArrayOfThemes()
        restoreSavedTheme()
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
    private func restoreSavedTheme() {
        guard let encodedTheme = dataStore?.getValue() as? Data else {return}
        let decoder = JSONDecoder()
        savedTheme =  try? decoder.decode(CalculatorTheme.self, from: encodedTheme)
        savedThemeIndex = setSavedIndexThemeId(savedTheme)
    }
    
    private func setSavedIndexThemeId(_ savedTheme: CalculatorTheme?) -> Int {
        return themes.firstIndex { $0.id == savedTheme?.id  } ?? 0
    }
    
    
    private func saveThemeToDisk(_ theme: CalculatorTheme) {
        let encoder = JSONEncoder()
        guard let encodedTheme = try? encoder.encode(theme) else { return }
        dataStore?.set(encodedTheme)
    }

    
    // MARK: - Next Theme
    
    func moveToNextTheme() {
        
        savedThemeIndex += 1
        if savedThemeIndex > themes.count - 1 {
            savedThemeIndex = 0
        }
        
        let theme = themes[savedThemeIndex]
        savedTheme = theme
        saveThemeToDisk(theme)
    }
    
}
