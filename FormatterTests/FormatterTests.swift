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
        XCTAssertEqual(format(1.23), "1.23")
        XCTAssertEqual(format(4.56), "4.56")
        XCTAssertEqual(format(7.89), "7.89")
        XCTAssertEqual(format(0.12), "0.12")
    }
    
    func test_roundsValuesToTwoFractionDigits() {
        XCTAssertEqual(format(1.234), "1.23")
        XCTAssertEqual(format(1.235), "1.24")
        XCTAssertEqual(format(1.236), "1.24")
        XCTAssertEqual(format(1.2300), "1.23")
        XCTAssertEqual(format(1.00023), "1.00")
    }
    
    func test_roundsValuesToTwoSignificantDigitsWhenLessThanOne() {
        XCTAssertEqual(format(0.000032), "0.000032")
        XCTAssertEqual(format(0.0000323343), "0.000032")
        XCTAssertEqual(format(0.0000328103), "0.000033")
        XCTAssertEqual(format(0.0000325103), "0.000033")
    }
    
    // MARK: Helpers
    
    func format(_ value: Decimal) -> String {
        Formatter.format(value, locale: Locale(identifier: "en_US"))
    }
}
