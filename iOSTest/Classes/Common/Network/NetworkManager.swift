//
//  NetworkManager.swift
//  iOSTest
//
//  Created by Shibin Moideen on 6/7/19.
//  Copyright © 2019 Shibin Moideen. All rights reserved.
//
import Foundation
import Alamofire
class NetworkManager {
    func fetchContacts(completion: @escaping(_ success: Bool, _ data: [Contact]?) -> Void) {
        if let url = URL.init(string: "http://gojek-contacts-app.herokuapp.com/contacts.json") {
            let urlRequest = URLRequest.init(url: url)
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let err = error {
                    Utils.showGenericErrorPopup(title: "Error", message: err.localizedDescription, button1Title: "Ok", button2Title: "")
                    completion(false, nil)
                }
                if let data = data {
                    let contactList = try! JSONDecoder().decode([Contact].self, from: data)
                    completion(true, contactList)
                }
            }.resume()
        }
    }
}
