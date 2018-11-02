//
// Created by Eugene on 02.11.18.
// Copyright (c) 2018 Eugene. All rights reserved.
//

import Foundation

class Display {

    func showStatus(car: Car) {
        print("On Display: \n Car model: \(car.model) \n engine status is \(car.engine.onOffState) \n speed is \(car.engine.currentSpeed)")
    }
}
