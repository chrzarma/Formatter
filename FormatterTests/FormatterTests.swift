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
        XCTAssertEqual(format(1.23, locale: Locale(identifier: "en_US")), "1.23")
        XCTAssertEqual(format(4.56, locale: Locale(identifier: "en_US")), "4.56")
        XCTAssertEqual(format(7.89, locale: Locale(identifier: "en_US")), "7.89")
        XCTAssertEqual(format(0.12, locale: Locale(identifier: "en_US")), "0.12")
    }
    
    func test_roundsValuesToTwoFractionDigits() {
        XCTAssertEqual(format(1.234, locale: Locale(identifier: "en_US")), "1.23")
        XCTAssertEqual(format(1.235, locale: Locale(identifier: "en_US")), "1.24")
        XCTAssertEqual(format(1.236, locale: Locale(identifier: "en_US")), "1.24")
        XCTAssertEqual(format(1.2300, locale: Locale(identifier: "en_US")), "1.23")
        XCTAssertEqual(format(1.00023, locale: Locale(identifier: "en_US")), "1.00")
    }
    
    func test_roundsValuesToTwoSignificantDigitsWhenLessThanOne() {
        XCTAssertEqual(format(0.000032, locale: Locale(identifier: "en_US")), "0.000032")
        XCTAssertEqual(format(0.0000323343, locale: Locale(identifier: "en_US")), "0.000032")
        XCTAssertEqual(format(0.0000328103, locale: Locale(identifier: "en_US")), "0.000033")
        XCTAssertEqual(format(0.0000325103, locale: Locale(identifier: "en_US")), "0.000033")
    }
}
