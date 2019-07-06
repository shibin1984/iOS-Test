//
//  ContactListCell.swift
//  iOSTest
//
//  Created by Shibin Moideen on 6/7/19.
//  Copyright © 2019 Shibin Moideen. All rights reserved.
//
import UIKit
import SDWebImage
class ContactListCell: UITableViewCell {
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var favouriteImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func loadCellData(contactData: Contact) {
        let firstName = contactData.first_name ?? ""
        let lastName = contactData.last_name ?? ""
        self.contactImage.sd_setImage(with: URL(string: "http://gojek-contacts-app.herokuapp.com/images/missing.png"),
                                      placeholderImage: UIImage(named: "placeholder.png"))
        self.contactName.text = firstName + " " + lastName
    }
}
