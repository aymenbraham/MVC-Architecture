//
//  DateExtensions.swift
//  SmartyHome
//
//  Created by aymen braham on 26/07/2020.
//  Copyright © 2020 AymenBraham. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    
    public func dateToString() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        return dateFormatter.string(from: date)

    }
}
