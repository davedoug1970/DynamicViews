//
//  StringExtensions.swift
//  DynamicViews
//
//  Created by David Douglas on 8/11/22.
//

import Foundation

extension String {
  static func random(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
  }
}
