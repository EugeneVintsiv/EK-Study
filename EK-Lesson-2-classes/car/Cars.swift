//
// Created by Eugene on 29.10.18.
// Copyright (c) 2018 Eugene. All rights reserved.
//

import Foundation

protocol Vehicle {
    func toggleEngine(engineState state: OnOffStatus)
    func goFaster()
    func goSlower()
    func doStop()
    func showStatusOnDisplay()
}

class Car : Vehicle {
    public let engine: Engine
    public let model: String
//    Incapsulation:
    private var display: Display? //used "nilable" and "var" cuz create Display in constructor.
/*
Question: what is the better way.
    Found a solution like:
private var _display: Display!
    var display: Display {
        return _display
    }
    init(model: String, engine: Engine) {
        self._display = Display(car: self)
    }

    but not like it, cuz much code used for init const
*/
    convenience init(model: String) {
        self.init(model: model, engine: Engine())
    }
//engine for possible scalability and
    init(model: String, engine: Engine) {
        self.engine = engine
        self.model = model
        self.display = Display(car: self)
    }

    func toggleEngine(engineState state: OnOffStatus) {
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
            toggleEngine(engineState: OnOffStatus.ON)
//            bad idea
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
        self.display?.showStatus()
    }
}


//Inheritance:
class Traktor: Car {
    private let ladle: Ladle = Ladle.init()

//    Closure definition
    func doActionViaClosure(closure: () -> Void) {
        closure()
    }
    func doAction(ladleCommand: LadleCommand...) {
        for command in ladleCommand {
//            in case enum method, just use command.method()
            self.ladle.doAction(command: command)
        }
    }

    override func toggleEngine(engineState state: OnOffStatus) {
        self.engine.toggleEngine(onOffState: state)

        let beforeLadleChange = self.ladle.ladleStatus
        self.ladle.toggleStatus()
        print("Changed ladle state from \(beforeLadleChange) to \(self.ladle.ladleStatus)")
    }

}

