import UIKit

//Declare serial and concurrent queues
let serialQueue = DispatchQueue(label: "serial")
let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)

//Global queue
DispatchQueue.global(qos: .userInitiated)

//Inactive queue
let inactiveQueue = DispatchQueue(label: "concurrent", attributes: [.initiallyInactive, .concurrent])

inactiveQueue.async {
    print("inactiveQueue concurrent")
}
//activate inactive queues
inactiveQueue.activate()



















































