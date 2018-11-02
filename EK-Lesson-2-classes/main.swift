//
//  main.swift
//  EK-Lesson-2-classes
//
//  Created by Eugene on 29.10.18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import Foundation

func main() {
//    redundant type, just for different usage :)
    let toyota: Vehicle = Car.init(model: "toyota")
    doActionsWithCar(car: toyota)
    let skoda = Car.init(model: "skoda", engine: Engine())
    doActionsWithCar(car: skoda)

    let traktor = Traktor.init(model: "John Deer")
    doTractorActions(traktor: traktor)


    print("=============")

    doClosureActions()
}

private func doTractorActions(traktor: Traktor) {
    doActionsWithCar(car: traktor)

    print("Traktor interact with ladle via method call")
    traktor.doAction(ladleCommand: LadleCommand.UP, LadleCommand.UP, LadleCommand.RIGHT, LadleCommand.RIGHT, LadleCommand.LEFT, LadleCommand.DOWN)

    print("Do Actions with Traktor as a closure")
//    Closure usage
    traktor.doActionViaClosure(closure: {
        traktor.doAction(ladleCommand: LadleCommand.UP, LadleCommand.UP, LadleCommand.RIGHT, LadleCommand.RIGHT, LadleCommand.LEFT, LadleCommand.DOWN)
    })
}

private func doActionsWithCar(car: Vehicle) {
    car.showStatusOnDisplay()
    car.goFaster()
    for _ in 0...8 {
        car.goFaster()
    }
    car.doStop()
    car.showStatusOnDisplay()
    print("=============")
}

main()

