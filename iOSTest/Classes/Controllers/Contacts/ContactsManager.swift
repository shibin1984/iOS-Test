//
//  ContactsManager.swift
//  iOSTest
//
//  Created by Shibin Moideen on 6/7/19.
//  Copyright © 2019 Shibin Moideen. All rights reserved.
//
import UIKit
protocol ContactsManagerDelegate: class {
    func didFinishFetchingContacts()
}
class ContactsManager: NSObject {
    static let shared = ContactsManager()
    private let service = NetworkManager()
    weak var delegate: ContactsManagerDelegate?
    var groupedList: [String : [Contact]]?
    var allKeys: [String]?
    func fetchContacts() {
        service.fetchContacts { (success, contactList) in
            // Group the list of contacts based on alphabets
            self.groupedList = Dictionary(grouping: contactList ?? [], by: { String($0.first_name?.prefix(1).uppercased() ?? "") })
            self.allKeys = Array(self.groupedList!.keys).sorted()
            if let delegate = self.delegate {
                delegate.didFinishFetchingContacts()
            }
        }
    }
}
