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
        var imageURL = contactData.profile_pic ?? ""
        if imageURL == Constants.NO_IMAGE_NAME {
            imageURL = Constants.BASE_IMAGE_URL + imageURL
        }
        self.contactImage.layer.cornerRadius = contactImage.frame.width / 2
        self.contactImage.sd_setImage(with: URL(string: imageURL),
                                      placeholderImage: UIImage(named: "placeholder.png"))
        self.contactName.text = firstName + " " + lastName
    }
}
