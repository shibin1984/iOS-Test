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
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        if let buttton1 = button1Title {
            alert.addAction(UIAlertAction(title: button1Title, style: .default) { _ in
                let url = URL(string: UIApplication.openSettingsURLString)!
                UIApplication.shared.open(url)
            })
        }
        if let buttton2 = button2Title {
            alert.addAction(UIAlertAction(title: button2Title, style: .cancel))
        }
        let window = UIApplication.shared.keyWindow
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
