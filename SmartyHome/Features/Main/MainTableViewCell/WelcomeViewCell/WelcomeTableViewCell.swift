//
//  WelcomeTableViewCell.swift
//  SmartyHome
//
//  Created by aymen braham on 26/07/2020.
//  Copyright © 2020 AymenBraham. All rights reserved.
//

import UIKit

class WelcomeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpButton()
        setUpTextFieldPlaceHolder()
        // Initialization code
    }
    
    func setUpButton() {
        continueButton.layer.cornerRadius = 8
        continueButton.clipsToBounds = true
        continueButton.setTitle("CONTINUE", for: .normal)
    }
    
    func setUpTextFieldPlaceHolder() {
        nameTextField.attributedPlaceholder = "Your Name".toAttributed(attributes:  [
            .foregroundColor: UIColor.grayColor,
            .font: UIFont.boldSystemFont(ofSize: 18.0)
        ] )
    }
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
