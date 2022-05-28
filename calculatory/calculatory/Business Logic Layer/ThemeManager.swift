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
    }

    
    private func saveThemeToDisk(_ theme: CalculatorTheme) {
        let encoder = JSONEncoder()
        guard let encodedTheme = try? encoder.encode(theme) else { return }
        dataStore?.set(encodedTheme)
    }

    
    // MARK: - Next Theme
    
    func moveToNextTheme() {

        // index of savedTheme in the array of themes
        let currentThemeId = currentTheme.id
        let index: Int? = themes.firstIndex { $0.id == currentThemeId}
        
        guard let indexOfExistingTheme = index else {
            // if this theme is not existing  then apply the first theme in the array of themes
            if let firstTheme = themes.first {
                updateThemeWithTheme(firstTheme)
            }
            // if there is not any themes then do nothing and just show the saved theme
            return
        }
        
        // if we have saved theme we then get the next theme of the saved (current) theme
        // then we Update system with the ( next ) new theme & then Save
        updateThemeWithTheme(getNextTheme(of: indexOfExistingTheme))
    }
    
    
    private func getNextTheme(of currentIndex: Int) -> CalculatorTheme {
        var indexOfExistingTheme = currentIndex
        indexOfExistingTheme += 1
        if indexOfExistingTheme > themes.count - 1 {
            indexOfExistingTheme = 0
        }
        return themes[indexOfExistingTheme]
    }
    
    
    private func updateThemeWithTheme(_ theme: CalculatorTheme) {
        savedTheme = theme
        saveThemeToDisk(theme)
    }
    
}
