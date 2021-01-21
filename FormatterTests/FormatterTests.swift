//
//  FormatterTests.swift
//  FormatterTests
//
//  Created by Christian Zarmakoupis on 21/1/21.
//

import XCTest
@testable import Formatter

class FormatterTests: XCTestCase {
    func test_twoFractionDigits() {
        XCTAssertEqual(format("1.23"), "1.23")
        XCTAssertEqual(format("4.56"), "4.56")
        XCTAssertEqual(format("7.89"), "7.89")
        XCTAssertEqual(format("0.12"), "0.12")
    }
    
    func test_roundsValuesToTwoFractionDigits() {
        XCTAssertEqual(format("1.234"), "1.23")
        XCTAssertEqual(format("1.235"), "1.24")
        XCTAssertEqual(format("1.236"), "1.24")
        XCTAssertEqual(format("1.2300"), "1.23")
        XCTAssertEqual(format("1.00023"), "1.00")
    }
    
    func test_roundsValuesToTwoSignificantDigitsWhenLessThanOne() {
        XCTAssertEqual(format("0.000032"), "0.000032")
        XCTAssertEqual(format("0.0000323343"), "0.000032")
        XCTAssertEqual(format("0.0000328103"), "0.000033")
        XCTAssertEqual(format("0.0000325103"), "0.000033")
    }
    
    func test_roundsHalfUpValuesToTwoFractionDigits() {
        XCTAssertEqual(format("1.005"), "1.01")
        XCTAssertEqual(format("2.006"), "2.01")
        XCTAssertEqual(format("3.007"), "3.01")
        XCTAssertEqual(format("4.008"), "4.01")
        XCTAssertEqual(format("5.009"), "5.01")
        XCTAssertEqual(format("1.001"), "1.00")
        XCTAssertEqual(format("2.002"), "2.00")
        XCTAssertEqual(format("3.003"), "3.00")
        XCTAssertEqual(format("4.004"), "4.00")
    }
    
    // MARK: Helpers
    
    func format(_ valueString: String) -> String {
        guard let value = Decimal(string: valueString) else { return "" }
        return Formatter.string(from: value, locale: Locale(identifier: "en_US"))
    }
}
