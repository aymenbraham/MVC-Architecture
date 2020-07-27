//
//  UIViewController.swift
//  SmartyHome
//
//  Created by aymen braham on 26/07/2020.
//  Copyright © 2020 AymenBraham. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    class func loadFromNibNamed(nibNamed: String, bundle : Bundle? = nil) -> UIViewController? {
    return UINib(
        nibName: nibNamed,
        bundle: bundle
    ).instantiate(withOwner: nil, options: nil)[0] as? UIViewController
}

}
