//
// Created by Eugene on 02.11.18.
// Copyright (c) 2018 Eugene. All rights reserved.
//

import Foundation

class Ladle {
    //    Incapsulation:
    private(set) var ladleStatus: Bool = false

    func toggleStatus() {
        self.ladleStatus = !self.ladleStatus ? true : false
    }

//    May be mode into enum
    func doAction(command ladleCommand: LadleCommand) {
        switch ladleCommand {
        case .right:
            print("Turn Ladle Right.")
        case .left:
            print("Turn Ladle Left")
        case .up:
            print("Move Ladle Up")
        case .down:
            print("Move Ladle Down")
//                do not need default, cuz all cases defined
        }
    }

}
