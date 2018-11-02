//
// Created by Eugene on 02.11.18.
// Copyright (c) 2018 Eugene. All rights reserved.
//

import Foundation

class Ladle {
    //    Incapsulation:
    public private(set) var ladleStatus: OnOffStatus = OnOffStatus.OFF
//    public private(set) var ladleStatus1: Bool = false

    func toggleStatus() {
        self.ladleStatus = self.ladleStatus == OnOffStatus.OFF ? OnOffStatus.ON : OnOffStatus.OFF
//        self.ladleStatus1 = !self.ladleStatus1 ? true : false
    }

//    May be mode into enum
    func doAction(command ladleCommand: LadleCommand) {
        switch ladleCommand {
        case .RIGHT:
            print("Turn Ladle Right.")
        case .LEFT:
            print("Turn Ladle Left")
        case .UP:
            print("Move Ladle Up")
        case .DOWN:
            print("Move Ladle Down")
//                do not need default, cuz all cases defined
        }
    }

}
