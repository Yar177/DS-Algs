//: [Previous](@previous)

import Foundation

var greeting = "Exploring Swift"


class Distance{
    //var inside a class are properties
    //type "object" properties or instance properties
    
    //type property also know as statuc prop
    static let kmPerMile = 1.60934
    static let feetPerKm:Double = 5280
    
    //instance property
    var miles: Double
    var km:Double
    
    //initializer
    init(miles:Double) {
        self.miles = miles
        self.km = Distance.toKm(miles: miles)
    }
    
    
    //function inside a class are methods
    //type "object" methods or instance methods
    //instance methods apply to each instance
    //type "object" method apply to the obejct itself
    
    func displayMiles() -> String{
        return "\(Int(miles)) miles"
    }
    
    static func toKm(miles:Double) -> Double{
        return miles * Distance.kmPerMile
    }
    
    //overloading function is the function that have same name with different params names
    static func toKm(feet:Double) -> Double{
        return feet / feetPerKm
    }
    
}

var distance = Distance(miles: 60)
print(distance.displayMiles())
print("2 miles = \(Distance.kmPerMile  * 2)  km")
print(Distance.toKm(miles: 30))
print(Distance.toKm(feet: 100))



//: [Next](@next)
