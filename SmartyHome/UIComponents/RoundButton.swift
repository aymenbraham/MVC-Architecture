//
//  RoundButton.swift
//  SmartyHome
//
//  Created by aymen braham on 26/07/2020.
//  Copyright © 2020 AymenBraham. All rights reserved.
//

import Foundation
import UIKit



public enum BigRoundedButtonType: Int {
  case blue = 0
}

@IBDesignable
class BigRoundedButton: UIButton {
    
    @IBInspectable var type: Int = 0 {
      didSet {
        setupButtonForType()
      }
    }
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      initalize()
    }
    
    override init(frame: CGRect) {
      let newFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: 60)
      super.init(frame: newFrame)
      initalize()
    }
    
    fileprivate func initalize() {
      
      self.needsUpdateConstraints()
      self.setNeedsLayout()
      
      // Corner radius
      self.layer.cornerRadius = 8
      self.clipsToBounds = true
  
      
      updateSize()
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
      super.setTitle(title, for: state)
      updateSize()
    }
    
    func buttonTypeForInt(int: Int) -> BigRoundedButtonType {
      if let enumType = BigRoundedButtonType(rawValue: type) {
        return enumType
      } else {
        return .blue
      }
    }
    func setupButtonForType() {
      
      switch buttonTypeForInt(int: type) {
      case .blue:
        // Background
        self.backgroundColor = .blueColor
        // Border
        self.layer.borderWidth = 0
        // Text color
        self.setTitleColor(UIColor.white, for: .normal)

      }
    }
    
    func updateSize() {
      // Insets
      let size = currentTitle?.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFontSize])
      guard size != nil else { return }
      
      self.needsUpdateConstraints()
      self.setNeedsLayout()
    }

}
