//
//  calculatoryTests.swift
//  calculatoryTests
//
//  Created by Mohamed Elatabany on 21/05/2022.
//

import XCTest
@testable import calculatory

class MathEquationTests: XCTestCase {


    func testAddition() throws {
        var mathEquation = MathEquation(lhs: .zero)
        mathEquation.lhs = 4
        mathEquation.operation = .add
        mathEquation.rhs = 8
        mathEquation.execute()
        let expectedResult = Decimal(12)
        XCTAssertEqual(mathEquation.result, expectedResult)
    }
    
    
    
    func testSubstraction() throws {
        var mathEquation = MathEquation(lhs: .zero)
        mathEquation.lhs = 4
        mathEquation.operation = .subtract
        mathEquation.rhs = 8
        mathEquation.execute()
        let expectedResult = Decimal(-4)
        XCTAssertEqual(mathEquation.result, expectedResult)
    }

    
    func testMultiplication() throws {
        var mathEquation = MathEquation(lhs: .zero)
        mathEquation.lhs = 4
        mathEquation.operation = .multiply
        mathEquation.rhs = 8
        mathEquation.execute()
        let expectedResult = Decimal(32)
        XCTAssertEqual(mathEquation.result, expectedResult)
    }


    
    func testDivision() throws {
        var mathEquation = MathEquation(lhs: .zero)
        mathEquation.lhs = 4
        mathEquation.operation = .divide
        mathEquation.rhs = 8
        mathEquation.execute()
        let expectedResult = Decimal(0.5)
        XCTAssertEqual(mathEquation.result, expectedResult)
    }


    

    
}
