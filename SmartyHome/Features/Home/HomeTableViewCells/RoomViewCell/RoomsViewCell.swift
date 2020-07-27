//
//  RoomsViewCell.swift
//  SmartyHome
//
//  Created by aymen braham on 27/07/2020.
//  Copyright © 2020 AymenBraham. All rights reserved.
//

import UIKit

class RoomsViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var roomImage: UIImageView!
    @IBOutlet weak var deviceNumberLabel: UILabel!
    
    // MARK: Variables
    var listRooms = [Room]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpContainer()
    }
    // MARK: SetUpUI
    // Setup Shawdow && Corner radius
    func setUpContainer() {
        self.roomImage.layer.cornerRadius = 8
        self.viewContainer.layer.cornerRadius = 8
        self.viewContainer.layer.masksToBounds = false
        self.viewContainer.layer.shadowColor = UIColor.gray.cgColor
        self.viewContainer.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.viewContainer.layer.shadowOpacity = 1
        self.viewContainer.layer.shadowRadius = 2
    }
    // MARK: Populate Rooms
    // Cell Configuration
    func populateRooms(listRooms: [Room],indexPath: IndexPath) {
        var devices: String
        roomNameLabel.text = listRooms[indexPath.row].roomName
        roomImage.image = UIImage(named: listRooms[indexPath.row].image)
        if listRooms[indexPath.row].numberDevice > 1 {
            devices = " Devices"
        } else {
            devices = " Device"

        }
        deviceNumberLabel.text = ("\(listRooms[indexPath.row].numberDevice)"  + devices)
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
