
//
//  CalculatorEngine.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 22/05/2022.
//



import Foundation

struct CalculatorEngine {
    
    
    enum OperandSide {
        case leftHandSide
        case rightHandSide
    }
    
    
    
    
    // MARK: - Math Equation
    
    private var mathEquation = MathEquation()
    private var operandSide = OperandSide.leftHandSide
    
    
    // MARK: - LCD Display
    var lcdDisplayText = ""
    
    
    
    
    // MARK: - Extra Functions
    
    mutating func clearPressed() {
        
    }
    
    mutating func negatePressed() {
        
    }
    
    mutating func percentagePressed() {
        
    }
    
    // MARK: - Operations
    
    mutating func addPressed() {
        mathEquation.operation = .add
        chaneOperand()
    }
    
    mutating func minusPressed() {
        mathEquation.operation = .subtract
        chaneOperand()
    }
    
    mutating func multiplyPressed() {
        mathEquation.operation = .multiply
        chaneOperand()
    }
    
    mutating func dividePressed() {
        mathEquation.operation = .divide
        chaneOperand()
    }
    
    mutating func equalsPressed() {
        mathEquation.execute()
        guard let result = mathEquation.result else {
            lcdDisplayText = "Error"
            return
        }
        
        if #available(iOS 15.0, *) {
            lcdDisplayText = result.formatted()
        } else {
            lcdDisplayText = String(describing: result)
        }
        
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
    
    
    mutating func chaneOperand() {
        operandSide = .rightHandSide
    }
    
    
}
