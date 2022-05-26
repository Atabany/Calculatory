//
//  MathEquation.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 21/05/2022.
//

import Foundation

struct MathEquation {

    enum OperationType {
        case add
        case subtract
        case multiply
        case divide
    }

    var lhs: Decimal = .zero
    var rhs: Decimal?
    var operation: OperationType?
    var result: Decimal?

    // MARK: - Execution
    
    var executed: Bool {
        return result != nil
    }

    mutating func execute() {
        
        guard
            let operation = operation,
            let rhs = rhs else {return}

        switch operation {
        case .add:
            result = lhs + rhs
        case .subtract:
            result = lhs - rhs
        case .multiply:
            result = lhs * rhs
        case .divide:
            result = lhs / rhs
        }

    }
    
    
    // MARK: - Negate

    mutating func negateLeftHandSide() {
        lhs.negate()
    }

    
    mutating func negateRightHandSide() {
        rhs?.negate()
    }

    // MARK: - Percentage
    
    mutating func applyPercentageToLeftHandSide() {
        lhs =  calculatePercentageValue(lhs)
    }
    
    mutating func applyPercentageToRightHandSide() {
        guard let decimal = rhs else {return}
        rhs =  calculatePercentageValue(decimal)
    }
    
    private func calculatePercentageValue(_ decimal: Decimal) -> Decimal {
        return decimal / 100
    }

    
    // MARK: - String Representation
    
    func generatePrintOut() -> String {
        guard let rhs = rhs,
              let result = result else { return "" }
        return "\(lhs) \(generateStringRepresentatoinOfOperation()) \(rhs) = \(result) "
    }
    
    private func generateStringRepresentatoinOfOperation() -> String {
        switch operation {
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "*"
        case .divide: return "/"
        case .none:
            return ""
        }
    }

}
