//
//  Constants.swift
//  SmartyHome
//
//  Created by aymen braham on 22/12/2020.
//  Copyright © 2020 AymenBraham. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    
    static let BaseURL =  ""
        
    static let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
    static func radius(_ value: CGFloat) -> CGFloat {
           return UIScreen.main.bounds.width * (value / 500)
    }
        
      static let XScreen = UIScreen.main.bounds.width
      static let HScreen = UIScreen.main.bounds.height
    
    class  func isValidEmail(_ email: String) -> Bool {
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          return emailPred.evaluate(with: email)
      }
      
      class func isPasswordRegulier(testPass: String) -> Bool {
          let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d\\w~@#$%^&*+=`|{}:;!.?\"()\\[\\]-]{8,60}$"
          let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
          return passwordTest.evaluate(with: testPass)
      }
    
    class func isUserConected() {
        
    }
    
    struct ScreenSize {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }

    struct DeviceType {
        
        static let IS_IPHONE            = UIDevice.current.userInterfaceIdiom == .phone
        static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPHONE_X          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH >= 812.0
        static let IS_IPHONE_X_MAX      = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 896.0
        
        
    }
}
