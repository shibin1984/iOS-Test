//
//  Utils.swift
//  iOSTest
//
//  Created by Shibin Moideen on 2/7/19.
//  Copyright © 2019 Shibin Moideen. All rights reserved.
//
import UIKit
class Utils: NSObject {
    static func showGenericErrorPopup(title: String, message: String, button1Title: String?, button2Title: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let button1Title = button1Title {
            alert.addAction(UIAlertAction.init(title: button1Title, style: .default, handler: nil))
        }
        if let button2Title = button2Title {
            alert.addAction(UIAlertAction.init(title: button2Title, style: .cancel, handler: nil))
        }
        let window = UIApplication.shared.keyWindow
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
struct ColorUtils {
    static var themeColor = UIColor.init(hex: "#50E3C2FF")
    static var lightGray = UIColor.init(hex: "#E8E8E8FF")
    static var darkGray = UIColor.init(hex: "#4A4A4AFF")
}
