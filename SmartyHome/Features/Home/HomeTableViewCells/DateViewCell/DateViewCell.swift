//
//  DateViewCell.swift
//  SmartyHome
//
//  Created by aymen braham on 27/07/2020.
//  Copyright © 2020 AymenBraham. All rights reserved.
//

import UIKit

class DateViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Cell Configuration
    func configCell(name: String) {
        nameLabel.text = "Welcome, \(name)!"
        dateLabel.text = Date().dateToString().uppercased()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
