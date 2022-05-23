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


    // MARK: - Math Equation
    
    private(set) var mathEquation = MathEquation()

    
    // MARK: - LCD Display
    
    var lcdDisplayText = ""
    

    // MARK: - Initialiser

    init() {
        if #available(iOS 15.0, *) {
            lcdDisplayText = mathEquation.lhs.formatted()
        } else {
            lcdDisplayText = String(describing: mathEquation.lhs)
        }
    }
    
    
    // MARK: - Extra Functions
    
    mutating func negatePressed() {
        
        var decimalNumber: Decimal?
        
        switch operandSide {
        case .leftHandSide:
            mathEquation.negateLeftHandSide()
            decimalNumber = mathEquation.lhs
        case .rightHandSide:
            mathEquation.negateRightHandSide()
            decimalNumber = mathEquation.rhs
        }


        if #available(iOS 15.0, *) {
            lcdDisplayText = decimalNumber?.formatted() ?? "Error"
        } else {
            let displayText = decimalNumber == nil ? "Error" : String(describing: decimalNumber)
            lcdDisplayText = displayText
        }
        
    }
    
    
    mutating func percentagePressed() {
        var decimalNumber: Decimal?
        
        switch operandSide {
        case .leftHandSide:
            mathEquation.applyPercentageToLeftHandSide()
            decimalNumber = mathEquation.lhs
        case .rightHandSide:
            mathEquation.applyPercentageToRightHandSide()
            decimalNumber = mathEquation.rhs
        }
        
        if #available(iOS 15.0, *) {
            lcdDisplayText = decimalNumber?.formatted() ?? "Error"
        } else {
            let displayText = decimalNumber == nil ? "Error" : String(describing: decimalNumber)
            lcdDisplayText = displayText
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
        
        if #available(iOS 15.0, *) {
            lcdDisplayText = mathEquation.result?.formatted() ?? "Error"
        } else {
            let displayText = mathEquation.result == nil ? "Error" : String(describing: mathEquation.result)
            lcdDisplayText = displayText
        }
    }
    

    // MARK: - Change Operand To rightHandSide

    mutating func chaneCurrentOperandToRightHandSide() {
        operandSide = .rightHandSide
    }
    
    
    
    // MARK: - Number Input
    
    mutating func decimalPressed() {
        
    }
    
    mutating func numberPressed(_ number: Int) {
        let decimalValue = Decimal(number)
        
        switch operandSide {
        case .leftHandSide:
            mathEquation.lhs = decimalValue
        case .rightHandSide:
            mathEquation.rhs = decimalValue
        }
        
        if #available(iOS 15.0, *) {
            lcdDisplayText = decimalValue.formatted()
        } else {
            // Fallback on earlier versions
            lcdDisplayText = String(describing: decimalValue)
        }
    }
    
    
}
