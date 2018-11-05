//
// Created by Eugene on 02.11.18.
// Copyright (c) 2018 Eugene. All rights reserved.
//

import Foundation

class Ladle {
    //    Incapsulation:
    public private(set) var ladleStatus: OnOffStatus = OnOffStatus.off
//    public private(set) var ladleStatus1: Bool = false

    func toggleStatus() {
        self.ladleStatus = self.ladleStatus == OnOffStatus.off ? OnOffStatus.on : OnOffStatus.off
//        self.ladleStatus1 = !self.ladleStatus1 ? true : false
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
