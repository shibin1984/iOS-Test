//
//  ContactHelper.swift
//  iOSTest
//
//  Created by Shibin Moideen on 2/7/19.
//  Copyright © 2019 Shibin Moideen. All rights reserved.
//
import UIKit
import Contacts
protocol ContactHelperDelegate: class {
    func didFinishFetchingContacts()
}
class ContactHelper: NSObject {
    static let shared = ContactHelper()
    weak var delegate: ContactHelperDelegate?
    var contacts = [CNContact]()
    func fectchContacts() {
        // First check of the current status of the Contacts permission
        let status = CNContactStore.authorizationStatus(for: .contacts)
        // If the Contact permission is not available present the user with the proper message
        if status == .denied || status == .restricted {
            presentSettingsActionSheet()
            return
        }
        // Provided the app has access to the Contacts list
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { granted, error in
            guard granted else {
                DispatchQueue.main.async {
                    self.presentSettingsActionSheet()
                }
                return
            }
            // Provide the list of key items that the app need to read
            let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactMiddleNameKey, CNContactPhoneNumbersKey, CNContactImageDataKey]
            let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
            do {
                // Enumerate through the list and add each items
                try store.enumerateContacts(with: request) { contact, stop in
                    self.contacts.append(contact)
                }
                // Finally sort the list based on the Given name of the Contact
                self.contacts = self.contacts.sorted { ($0.givenName ) < ($1.givenName) }
                // Tell the delegate that the contact fetching is completed.
                if let delegate = self.delegate {
                    delegate.didFinishFetchingContacts()
                }
            } catch {
                print(error)
            }
        }
    }
    func presentSettingsActionSheet() {
        Utils.showGenericErrorPopup(title: "Permission to Contacts", message: "This app needs access to contacts in order to ...", button1Title: "Go to Settings", button2Title: "Cancel")
    }
}
