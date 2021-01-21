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
}
