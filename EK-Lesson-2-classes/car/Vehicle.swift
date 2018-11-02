//
// Created by Eugene on 02.11.18.
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
