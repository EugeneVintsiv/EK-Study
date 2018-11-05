//
// Created by Eugene on 02.11.18.
// Copyright (c) 2018 Eugene. All rights reserved.
//

import Foundation

class Car: Vehicle {
    let model: String
    let engine: Engine
    private var display: Display

    init(model: String, engine: Engine = Engine(), _ display: Display = Display()) {
        self.engine = engine
        self.model = model
        self.display = display
    }

    func toggleEngine(engineState state: Bool) {
        let beforeChange = self.engine.onOffState
        self.engine.toggleEngine(onOffState: state)
        print("Changed engine state from \(beforeChange) to \(self.engine.onOffState)")
    }

    func goFaster() {
        do {
            try self.engine.goFaster()
            print("Doing faster, New speed is: \(self.engine.currentSpeed)")
        } catch {
            print("Unable do go faster, cuz engine is OFF, trying to turn Engine ON and repeat go faster.")
            toggleEngine(engineState: true)
//            bad idea to ignore try
            try! self.engine.goFaster()
            print("Doing faster, New speed is: \(self.engine.currentSpeed)")
        }
    }

    func goSlower() {
        do {
            try self.engine.goSlower()
            print("Doing slowly, New speed is: \(self.engine.currentSpeed)")
        } catch {
            print("Unable do go slower, cuz engine is OFF. Do not do anything, please relax.")
        }
    }

    func doStop() {
        self.engine.doStop()
        print("Doing slower to 0 and turned engine OFF.")
    }

    func showStatusOnDisplay() {
        self.display.showStatus(car: self)
    }
}
