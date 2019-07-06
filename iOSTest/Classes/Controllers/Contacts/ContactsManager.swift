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
    var contactList: [Contact]?
    func fetchContacts() {
        service.fetchContacts { (success, contactList) in
            self.contactList = contactList
            if let delegate = self.delegate {
                delegate.didFinishFetchingContacts()
            }
        }
    }
}
