//
// Created by Eugene on 30.10.18.
// Copyright (c) 2018 Eugene. All rights reserved.
//

import Foundation

fileprivate class Item {
    private(set) var sortField: Int = 0

    init(_ sortValue: Int) {
        self.sortField = sortValue
    }
}

func doClosureActions() {
    let items: Array = [Item(3), Item(2), Item(6), Item(0), Item(4)]

    print("Print initial items:")
    runEachWithClosure(items)
    print("=============")

    print("Sort via closure asc :")
    let sorted = sort(items) {
        $0.sortField < $1.sortField
    }
    runEachWithClosure(sorted)
    print("=============")

    print("Sort via closure desc :")
    let sortedDesc = sort(items) {
        $0.sortField > $1.sortField
    }
    runEachWithClosure(sortedDesc)
    print("=============")
}

//2.1 Створіть свій аналог функції forEach яка б проходила по всім елементам
private func runEachWithClosure(_ items: [Item]) {
    forEachWithClosure(elements: items) { item in
        print(item.sortField)
    }
}

private func forEachWithClosure(elements arr: [Item], function: (Item) -> Void) {
    for item in arr {
        function(item)
    }
}

//2.2 Створіть свій аналог функції sort яка б використовувала передану умову
private func sort(_ array: [Item], _ condition: (Item, Item) -> Bool) -> [Item] {
    guard array.count > 1 else {
        return array
    }

    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y]
        while y > 0 && condition(temp, a[y - 1]) {
            a[y] = a[y - 1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}

