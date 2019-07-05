//
//  ViewController.swift
//  iOSTest
//
//  Created by Shibin Moideen on 2/7/19.
//  Copyright © 2019 Shibin Moideen. All rights reserved.
//
import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ContactHelper.shared.delegate = self
        ContactHelper.shared.fectchContacts()
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactHelper.shared.contacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL_IDENTIFIER", for: indexPath)
        cell = UITableViewCell(style: .default, reuseIdentifier: "CELL_IDENTIFIER")
        let contact = ContactHelper.shared.contacts[indexPath.row]
        cell.textLabel?.text = contact.givenName + " " + contact.familyName
        cell.detailTextLabel?.text = contact.phoneNumbers.first?.value.stringValue
        if let imageData = contact.imageData {
            cell.imageView?.image = UIImage.init(data: imageData)
        }
        return cell
    }
}
extension ViewController: ContactHelperDelegate {
    func didFinishFetchingContacts() {
        // Reload the List view on the main thread once the contacts are fetched.
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

