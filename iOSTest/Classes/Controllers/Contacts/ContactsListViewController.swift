//
//  ContactsListViewController.swift
//  iOSTest
//
//  Created by Shibin Moideen on 6/7/19.
//  Copyright © 2019 Shibin Moideen. All rights reserved.
//
import UIKit
class ContactsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.sectionIndexColor = ColorUtils.lightGray
        }
    }
    let manager = ContactsManager.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create the left Navigation bar button item
        let leftBarItem = UIBarButtonItem.init(title: "Groups".localize(), style: .plain, target: self, action: #selector(leftBarButtonAction))
        self.navigationItem.setLeftBarButton(leftBarItem, animated: true)
        // Create the Right Navigation bar button item
        let rightBarItem = UIBarButtonItem.init(title: "+", style: .plain, target: self, action: #selector(rightBarButtonAction))
        self.navigationItem.setRightBarButton(rightBarItem, animated: true)
        // Set the Navigation bar tint color
        self.navigationController?.navigationBar.tintColor = ColorUtils.themeColor
        manager.delegate = self
        manager.fetchContacts()
    }
    @objc func rightBarButtonAction() {
        // Load the add new contact screen
    }
    @objc func leftBarButtonAction() {
        // Nothing to do. Requirement not specified.
    }
}
extension ContactsListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return manager.allKeys?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let key = manager.allKeys?[section] {
            return manager.groupedList?[key]?.count ?? 0
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactListCell", for: indexPath) as? ContactListCell
        if let key = manager.allKeys?[indexPath.section] {
            let keyItems = manager.groupedList?[key]
            if let contact = keyItems?[indexPath.row] {
                cell?.loadCellData(contactData: contact)
            }
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let key = manager.allKeys?[section] {
            return key
        }
        return nil
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if let key = manager.allKeys {
            return key
        }
        return nil
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
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
