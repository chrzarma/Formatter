//
//  Formatter.swift
//  Formatter
//
//  Created by Christian Zarmakoupis on 21/1/21.
//

import Foundation

public final class Formatter {
    public static func format(_ value: Decimal, locale: Locale) -> String {
        let nf = NumberFormatter()
        nf.maximumFractionDigits = 2
        nf.minimumFractionDigits = 2
        nf.locale = locale

        if value < 1 {
            nf.maximumSignificantDigits = 2
        }

        return nf.string(from: value as NSNumber) ?? ""
     }
 }

