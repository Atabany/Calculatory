//
//  calculatoryTests.swift
//  calculatoryTests
//
//  Created by Mohamed Elatabany on 21/05/2022.
//

import XCTest
@testable import calculatory

class MathEquationTests: XCTestCase {


    private var mathEquation: MathEquation!
    
    override func setUp() {
        super.setUp()
        mathEquation = MathEquation(rhs: .zero)
        mathEquation.lhs = 4
        mathEquation.rhs = 8
    }
    
    override func tearDown() {
        mathEquation = nil
        super.tearDown()
    }
    
    
    func testAddition() throws {
        mathEquation.operation = .add
        mathEquation.execute()
        let expectedResult = Decimal(12)
        XCTAssertEqual(mathEquation.result, expectedResult)
    }
    
    
    
    func testSubstraction() throws {
        mathEquation.operation = .subtract
        mathEquation.execute()
        let expectedResult = Decimal(-4)
        XCTAssertEqual(mathEquation.result, expectedResult)
    }

    
    func testMultiplication() throws {
        mathEquation.operation = .multiply
        mathEquation.execute()
        let expectedResult = Decimal(32)
        XCTAssertEqual(mathEquation.result, expectedResult)
    }


    
    func testDivision() throws {
        mathEquation.operation = .divide
        mathEquation.execute()
        let expectedResult = Decimal(0.5)
        XCTAssertEqual(mathEquation.result, expectedResult)
    }


    

    
}
