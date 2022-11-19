//
//  File.swift
//  
//
//  Created by Joe Maghzal on 11/18/22.
//

import XCTest
@testable import CoreMathematics

final class PolynomialTests: XCTestCase {
    func testPolynomial() {
        let test = 8*x + x**2 - 5
        XCTAssertEqual(test.polynomial?.coefficients, [0: -5.0, 1: 8.0, 2: 1])
    }
    func testOrder() {
        let coefficients = (8*x + x**2 - 5).polynomial?.coefficients
        XCTAssertEqual(coefficients?.order, 2)
    }
    func testRoot1() {
        let test = (2*x + 4).polynomial
        XCTAssertEqual(test?.root.contains(where: {$0.value == -2}), true)
    }
    func testRoot2Positive() {
        let test = (4*x + x**2 + 4).polynomial
        XCTAssertEqual(test?.root.filter({$0.value == -2}).count == 2, true)
    }
    func testRoot2Negative() {
        let test = (x + x**2 + 4).polynomial
        print(test?.root)
        XCTAssertEqual(test?.root.filter({$0.value == -2}).count == 2, false)
    }
    func testRootSecant() {
        let test = (4*x + x**2 + 4).polynomial
        XCTAssertEqual(test?.secant().filter({$0.value == -2}).count == 2, false)
    }
    func testEquation() {
        let test = Equation(left: 4*x + x**2 + 6, right: 2)
        XCTAssertEqual(test.solve().filter({$0.value == -2}).count == 2, true)
    }
}
