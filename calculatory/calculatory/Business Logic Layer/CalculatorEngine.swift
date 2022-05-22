
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


    // MARK: - Equation History
    private var historyLog = [MathEquation]()

    
    
    // MARK: - LCD Display
    lazy var lcdDisplayText = ""
    
    
    
    
    // MARK: - Extra Functions
    
    mutating func clearPressed() {
        mathEquation = MathEquation()
        operandSide = .leftHandSide
        
        if #available(iOS 15.0, *) {
            lcdDisplayText = mathEquation.lhs.formatted()
        } else {
            lcdDisplayText = String(describing: mathEquation.lhs)
        }
    }
    
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

        guard let decimalNumber = decimalNumber else {
            lcdDisplayText = "Error"
            return
        }
        
        if #available(iOS 15.0, *) {
            lcdDisplayText = decimalNumber.formatted()
        } else {
            lcdDisplayText = String(describing: decimalNumber)
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

        guard let decimalNumber = decimalNumber else {
            lcdDisplayText = "Error"
            return
        }
        
        if #available(iOS 15.0, *) {
            lcdDisplayText = decimalNumber.formatted()
        } else {
            lcdDisplayText = String(describing: decimalNumber)
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
        historyLog.append(mathEquation)

        printEquationToDebugConsole()
        
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
    
    // MARK: - Change Operand To rightHandSide

    mutating func chaneCurrentOperandToRightHandSide() {
        operandSide = .rightHandSide
    }
    
    
    // MARK: - Debug Console
    
    private func printEquationToDebugConsole() {
        print("Equation: " + mathEquation.generatePrintOut())
    }
    
    
    
    // MARK: - History Log
    
    mutating private func clearHistory() {
        historyLog = []
    }
    
    


}
