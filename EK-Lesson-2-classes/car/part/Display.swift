//
// Created by Eugene on 02.11.18.
// Copyright (c) 2018 Eugene. All rights reserved.
//

import Foundation

class Display {
    //    Incapsulation:
    private let car: Car

    init(car: Car) {
        self.car = car
    }

    func showStatus() {
        print("On Display: \n Car model: \(self.car.model) \n engine status is \(self.car.engine.onOffState) \n speed is \(self.car.engine.currentSpeed)")
    }
}
