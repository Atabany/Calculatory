//
//  MathInputController.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 23/05/2022.
//

import Foundation

struct MathInputController {
    
    // MARK: - Operand Editing Side
    
    enum OperandSide {
        case leftHandSide
        case rightHandSide
    }
    
    
    private var operandSide = OperandSide.leftHandSide
    
    
    // MARK: - Constants
    let groupingSybmol = Locale.current.groupingSeparator ?? ","

    
    // MARK: - Math Equation
    
    private(set) var mathEquation = MathEquation()
    
    
    // MARK: - LCD Display
    
    var lcdDisplayText = ""
    
    
    // MARK: - Initialiser
    
    init() {
        lcdDisplayText =  formatLCDDisplay(mathEquation.lhs)
    }
    
    
    // MARK: - Extra Functions
    
    mutating func negatePressed() {
        switch operandSide {
        case .leftHandSide:
            mathEquation.negateLeftHandSide()
            lcdDisplayText =  formatLCDDisplay(mathEquation.lhs)
        case .rightHandSide:
            mathEquation.negateRightHandSide()
            lcdDisplayText =  formatLCDDisplay(mathEquation.rhs)
        }
    }
    
    
    mutating func percentagePressed() {
        switch operandSide {
        case .leftHandSide:
            mathEquation.applyPercentageToLeftHandSide()
            lcdDisplayText = formatLCDDisplay(mathEquation.lhs)
        case .rightHandSide:
            mathEquation.applyPercentageToRightHandSide()
            lcdDisplayText = formatLCDDisplay(mathEquation.rhs)
        }
    }
    
    
    
    // MARK: - Operations
    
    mutating func addPressed() {
        mathEquation.operation = .add
        chaneCurrentOperandToRightHandSide()
    }
    
    mutating func minusPressed() {
        mathEquation.operation = .subtract
        chaneCurrentOperandToRightHandSide()
    }
    
    mutating func multiplyPressed() {
        mathEquation.operation = .multiply
        chaneCurrentOperandToRightHandSide()
    }
    
    mutating func dividePressed() {
        mathEquation.operation = .divide
        chaneCurrentOperandToRightHandSide()
    }
    
    mutating func execute() {
        mathEquation.execute()
        lcdDisplayText = formatLCDDisplay(mathEquation.result)
    }
    
    
    // MARK: - Change Operand To rightHandSide
    
    mutating func chaneCurrentOperandToRightHandSide() {
        operandSide = .rightHandSide
    }
    
    
    
    // MARK: - Number Input
    
    mutating func decimalPressed() {
        
    }
    
    mutating func numberPressed(_ number: Int) {
        guard number >= -9 , number <= 9 else { return }
        switch operandSide {
        case .leftHandSide:
            let tuple = appendNewNumber(number, toPreviousInput: mathEquation.lhs)
            mathEquation.lhs  = tuple.newNumber
            lcdDisplayText = tuple.newLCDDisplayText
        case .rightHandSide:
            let tuple = appendNewNumber(number, toPreviousInput: mathEquation.rhs ?? .zero)
            mathEquation.rhs  = tuple.newNumber
            lcdDisplayText = tuple.newLCDDisplayText
        }
    }
    
    
    private func appendNewNumber(_ number: Int, toPreviousInput previousInput: Decimal) -> (newNumber:  Decimal , newLCDDisplayText:  String) {

        let stringInput = String(number)
        var newStringRepresentation = previousInput.isZero ? "" : lcdDisplayText
        newStringRepresentation.append(stringInput)

        
        newStringRepresentation = newStringRepresentation.replacingOccurrences(of: groupingSybmol , with: "")
        
        
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        
        
        guard let convertedNumber = formatter.number(from: newStringRepresentation) else {return (.zero, "Error")}

        let newNumber = convertedNumber.decimalValue

        let newLCDDisplayText =  formatLCDDisplay(newNumber)
        
        return (newNumber, newLCDDisplayText)
    }
    
    
    
    // MARK: - LCD Display Formatting
    
    private func formatLCDDisplay(_ number: Decimal?) -> String {
        guard let number = number else { return  "Error" }
        return number.formatted()
    }
    

}


