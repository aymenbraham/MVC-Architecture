//
//  Room.swift
//  SmartyHome
//
//  Created by aymen braham on 27/07/2020.
//  Copyright © 2020 AymenBraham. All rights reserved.
//

import Foundation

struct Room {
    var roomName: String
    var numberDevice: Int
    var image: String
    
    init(roomName: String, numberDevice: Int, image: String) {
        self.roomName = roomName
        self.numberDevice = numberDevice
        self.image = image
    }
}
