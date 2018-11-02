//
// Created by Eugene on 02.11.18.
// Copyright (c) 2018 Eugene. All rights reserved.
//

import Foundation

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
