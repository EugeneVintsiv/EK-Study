//
// Created by Eugene on 02.11.18.
// Copyright (c) 2018 Eugene. All rights reserved.
//

import Foundation

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