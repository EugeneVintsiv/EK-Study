//
// Created by Eugene on 02.11.18.
// Copyright (c) 2018 Eugene. All rights reserved.
//

import Foundation

class Engine {
//    Incapsulation:
    private(set) var onOffState: Bool = false
//    Incapsulation:
    private(set) var currentSpeed: Int = 0
    let maxSpeed: Int = 160
    private let speedStep = 30;

    func toggleEngine(onOffState state: Bool) {
        if currentSpeed > 0 && !state {
            print("Unable to turn off engine when speed > 0")
        }
        onOffState = state;
    }

    func goFaster() throws {
        if !onOffState {
            throw CarError.isNotTurnedOff
        }
        let speedToSet: Int = currentSpeed + speedStep
        currentSpeed = speedToSet > maxSpeed ? maxSpeed : speedToSet
    }

    func goSlower() throws {
        if !onOffState {
            throw CarError.isNotTurnedOff
        }
        let speedToSet: Int = currentSpeed - speedStep
        currentSpeed = speedToSet < 0 ? 0 : speedToSet
    }

    func doStop() {
        for _ in stride(from: currentSpeed, to: 0, by: -1 * speedStep) {
            sleep(1)
            let speedToSet: Int = currentSpeed - speedStep
            currentSpeed = speedToSet < 0 ? 0 : speedToSet
            print("Doing stop, new speed: \(currentSpeed)")
        }
        toggleEngine(onOffState: false)
    }

    private func isEngineTurnedOn() throws {

    }
}