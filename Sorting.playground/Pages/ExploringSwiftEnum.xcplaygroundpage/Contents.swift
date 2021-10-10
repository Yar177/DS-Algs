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
    case year(Int)
}
let dates:[DateType] = [
    DateType.singleDate(now),
    DateType.dateRange(now..<hourFromNow)
]

for dateType in dates{
    switch dateType{
    case .singleDate(let date): print("Date is \(date)")
    case .dateRange(let range): print("Range is \(range)")
    case .year(let year): print("Year is \(year)")
    }
}

//Enum
//algebraic data types - sum types - or types
//enum can only be one thing at once
//mutually exclusive properties

struct MessageStruct {
    let userId: String
    let contents: String?
    let date: Date
    let hasJoined: Bool
    let hasLeft: Bool
    let isBeingDrafted: Bool
    let isSendingBalloons: Bool
}


let joinMessage = MessageStruct(userId: "1",
                          contents: nil,
                          date: Date(),
                          hasJoined: true, // We set the joined boolean
                          hasLeft: false,
                          isBeingDrafted: false,
                          isSendingBalloons: false)


let textMessage = MessageStruct(userId: "2",
                          contents: "Hey everyone!", // We pass a message
                          date: Date(),
                          hasJoined: false,
                          hasLeft: false,
                          isBeingDrafted: false,
                          isSendingBalloons: false)


//associated values
enum Message {
    case text(userId:String, contents:String, date:Date)
    case draft(userId:String, date:Date)
    case join(userId:String, date:Date)
    case leave(userId:String, date:Date)
    case balloon(userId:String, date:Date)
}

let textMessageEnum = Message.text(userId: "2", contents: "Bonjour!", date: Date())
let joinMessageEnum = Message.join(userId: "2", date: Date())

func logMessage(message: Message){
    switch message{
    case let .text(userId: id, contents: contents, date: date):
        print("[\(date)] User \(id) sends message: \(contents)")
    case let .draft(userId: id, date: date):
        print("[\(date)] User \(id) is drafting a message")
    case let .join(userId: id, date: date):
        print("[\(date)] User \(id) has joined the chatroom")
    case let .leave(userId: id, date: date):
        print("[\(date)] User \(id) has left the chatroom")
    case let .balloon(userId: id, date: date):
        print("[\(date)] User \(id) is sending balloons")
    }
}

logMessage(message: textMessageEnum)
logMessage(message: joinMessageEnum)




































































































































































































//: [Next](@next)
