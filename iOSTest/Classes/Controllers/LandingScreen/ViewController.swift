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
        let rightBarItem = UIBarButtonItem.init(title: "+", style: .plain, target: self, action: #selector(rightBarButtonAction))
        self.navigationItem.setRightBarButton(rightBarItem, animated: true)
    }
    @objc func rightBarButtonAction() {
        // Load the Map View
//        let mainSB = UIStoryboard.init(name: "Main", bundle: nil)
//        if let mapVC = mainSB.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController {
//            self.navigationController?.pushViewController(mapVC, animated: true)
//        }
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactListCell", for: indexPath) as? ContactListCell
        if let cell = cell {
            cell.contactName.text = "Shibin"
            return cell
        }
        let defaultCell = tableView.dequeueReusableCell(withIdentifier: "CELL_IDENTIFIER", for: indexPath)
        return defaultCell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
extension ViewController: UITableViewDelegate {
}
extension ViewController: ContactHelperDelegate {
    func didFinishFetchingContacts() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

