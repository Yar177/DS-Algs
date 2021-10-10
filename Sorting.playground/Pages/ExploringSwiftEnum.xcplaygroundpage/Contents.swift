//: [Previous](@previous)

import Foundation
import UIKit


struct Run {
    let id: String
    let startTime: Date
    let endTime: Date
    let distance: Float
    let onRunningTrack: Bool
}

struct Cycle{
    enum CycleType{
        case regular
        case mountainBike
        case racetrack
    }
    
    let id: String
    let startTime: Date
    let endTime: Date
    let distance: Float
    let inclince: Int
    let type: CycleType
}

struct Pushups {
    let id: String
    let repetitions:[Int]
    let date:Date
}

enum Workout{
    case run(Run)
    case cycle(Cycle)
    case pushups(Pushups)
    
}

let pushup1 = Pushups(id: "121", repetitions: [22,20,21], date: Date())
let workout = Workout.pushups(pushup1)

switch workout{
case .run(let run):
    print("Run \(run)")
case .cycle(let cycle):
    print("Cycle \(cycle)")
case .pushups(let pushups):
    print("Pushups \(pushups)")
}


print(Date())


let arr: [Any] = [Date(), "string_#1", "string_#2", 2021]
for element in arr{
    switch element{
    case let stringValue as String: print("received a string \(stringValue)")
    case let intValue as Int: print("received an Int: \(intValue)")
    case let dateValue as Date: print("recived date: \(dateValue)")
    default: print("Unknown type")
    }
}

print(arr)

//Compile-time polymorphism
let now = Date()
let hourFromNow = Date(timeIntervalSinceNow: 3600)

enum DateType{
    case singleDate(Date)
    case dateRange(Range<Date>)
}
let dates:[DateType] = [
    DateType.singleDate(now),
    DateType.dateRange(now..<hourFromNow)
]

for dateType in dates{
    switch dateType{
    case .singleDate(let date): print("Date is \(date)")
    case .dateRange(let range): print("Range is \(range)")
    }
}

//: [Next](@next)
