//
//  ContactsListViewController.swift
//  iOSTest
//
//  Created by Shibin Moideen on 6/7/19.
//  Copyright © 2019 Shibin Moideen. All rights reserved.
//
import UIKit
class ContactsListViewController: UIViewController {@IBOutlet weak var tableView: UITableView!
    let manager = ContactsManager.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightBarItem = UIBarButtonItem.init(title: "+", style: .plain, target: self, action: #selector(rightBarButtonAction))
        self.navigationItem.setRightBarButton(rightBarItem, animated: true)
        manager.delegate = self
        manager.fetchContacts()
    }
    @objc func rightBarButtonAction() {
        // Load the Map View
        //        let mainSB = UIStoryboard.init(name: "Main", bundle: nil)
        //        if let mapVC = mainSB.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController {
        //            self.navigationController?.pushViewController(mapVC, animated: true)
        //        }
    }
}
extension ContactsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.contactList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactListCell", for: indexPath) as? ContactListCell
        if let contact = manager.contactList?[indexPath.row] {
            cell?.loadCellData(contactData: contact)
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
extension ContactsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
extension ContactsListViewController: ContactsManagerDelegate {
    func didFinishFetchingContacts() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
