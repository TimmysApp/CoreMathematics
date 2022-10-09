import XCTest
@testable import PhysicsKit

final class OperationsTests: XCTestCase {
    func testAdditionNil() {
        var test = x + 5 + x*x
        test.evaluate(with: (y, 9))
        XCTAssertEqual(test.value, nil)
    }
    func testAddititionValue() {
        var test = x + 5 + x*x
        test.evaluate(with: (x, 9))
        XCTAssertEqual(test.value, 95)
    }
    func testSubstractionNil() {
        var test = x - 9 - x*x
        test.evaluate(with: (y, 9))
        XCTAssertEqual(test.value, nil)
    }
    func testSubstractionValue() {
        var test = x - 9 + x*x
        test.evaluate(with: (x, 5))
        XCTAssertEqual(test.value, 21)
    }
    func testMultiplicationNil() {
        var test = x * 5 * x
        test.evaluate(with: (y, -9))
        XCTAssertEqual(test.value, nil)
    }
    func testMultiplicationValue() {
        var test = x * 5 * (-x)
        test.evaluate(with: (x, -9))
        XCTAssertEqual(test.value, -405)
    }
    func testDivisionNil() {
        var test = (x*x)/(8*x)
        test.evaluate(with: (y, -9))
        XCTAssertEqual(test.value, nil)
    }
    func testDivisionValue() {
        var test = (x*x)/(8*x)
        test.evaluate(with: (x, 5))
        XCTAssertEqual(test.value, 5/8)
    }
    func testRegulars() {
        let test = 5*6
        XCTAssertEqual(test, 30)
    }
}
