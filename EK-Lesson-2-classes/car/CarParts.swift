//
// Created by Eugene on 29.10.18.
// Copyright (c) 2018 Eugene. All rights reserved.
//

import Foundation

enum OnOffStatus: String {
    case ON
    case OFF
}

class Engine {
//    Incapsulation:
    public private(set) var onOffState: OnOffStatus = OnOffStatus.OFF
//    Incapsulation:
    public private(set) var currentSpeed: Int = 0
    let maxSpeed: Int = 160
    private let speedStep = 30;

    func toggleEngine(onOffState state: OnOffStatus) {
        if (currentSpeed > 0 && state == OnOffStatus.OFF) {
            print("Unable to turn off engine when speed > 0")
        }
        self.onOffState = state;
    }

    func goFaster() throws {
        if (onOffState == OnOffStatus.OFF) {
            throw CarError.isNotTurnedOff
        }
        let speedToSet: Int = self.currentSpeed + self.speedStep
        self.currentSpeed = speedToSet > maxSpeed ? maxSpeed : speedToSet
    }

    func goSlower() throws {
        if (onOffState == OnOffStatus.OFF) {
            throw CarError.isNotTurnedOff
        }
        let speedToSet: Int = self.currentSpeed - self.speedStep
        self.currentSpeed = speedToSet < 0 ? 0 : speedToSet
    }

    func doStop() {
        for _ in stride(from: self.currentSpeed, to: 0, by: -1 * self.speedStep) {
            sleep(1)
            let speedToSet: Int = self.currentSpeed - self.speedStep
            self.currentSpeed = speedToSet < 0 ? 0 : speedToSet
            print("Doing stop, new speed: \(self.currentSpeed)")
        }
        toggleEngine(onOffState: OnOffStatus.OFF)
    }

    private func isEngineTurnedOn() throws {

    }
}

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