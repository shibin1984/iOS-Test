//
//  StringExtension.swift
//  iOSTest
//
//  Created by Shibin Moideen on 7/7/19.
//  Copyright © 2019 Shibin Moideen. All rights reserved.
//
import Foundation
extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
