//
//  Formatter.swift
//  Formatter
//
//  Created by Christian Zarmakoupis on 21/1/21.
//

import Foundation

func format(_ value: Decimal, locale: Locale) -> String {
    let nf = NumberFormatter()
    nf.maximumFractionDigits = 2
    nf.locale = locale
    
    return nf.string(from: value as NSNumber) ?? ""
}
