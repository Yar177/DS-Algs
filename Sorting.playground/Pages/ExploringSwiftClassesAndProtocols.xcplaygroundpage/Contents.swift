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
    //calculated km value
    var km:Double{
        get{
        return Distance.toKm(miles: miles)
        }
        set(newKm){
            miles = Distance.toMiles(km: newKm)
        }
    }
    
    //initializer
    init(miles:Double) {
        self.miles = miles
       // self.km = Distance.toKm(miles: miles) //commented out after adding calculated km value
    }
    
    //overloaded initializer
//    init(km:Double) {
//        self.km = km
//        self.miles = Distance.toMiles(km: km)
//    }
    
    //convenience initializers must call self.init to complete the init process
    convenience init(km:Double){
        self.init(miles:Distance.toMiles(km: km))
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
    
    //overloading function is the function that have same name with different params names or types
    static func toKm(feet:Double) -> Double{
        return feet / feetPerKm
    }
    
    static func toMiles(km:Double) -> Double{
        return km / kmPerMile
    }
    static func toMiles(km:Int) -> Double{
        return Double(km) / kmPerMile
    }
    
}

var distance = Distance(miles: 60)
print(distance.displayMiles())
print("2 miles = \(Distance.kmPerMile  * 2)  km")
print(Distance.toKm(miles: 30))
print(Distance.toKm(feet: 100))

var dis1 = Distance(miles: 60)
var dis2 = Distance(km: 100)

var dis = Distance(km: 100)
dis.km = 35
dis.miles = 90



class Telephone{
    func makeCall() {
        //make call here
    }
    func hangUp(){
        //hang up here
    }
}

class LandLine: Telephone{
    
}

class Cellular: Telephone{
    func sendSMS(){
       //send sms here
    }
    
    override func makeCall() {
        super.makeCall()
        //make cell call
    }
}



// protocols specify the methods and properties that an object "type" will need to impliment
//protocol only indicate the definition of the method and not the actual body
//func makeCall()

protocol TelephoneProtocol{
    var phoneNum:Int { get set }
    func makeCall()
    func hangUp()
}

extension TelephoneProtocol{
    func makeCall(){
        print("Make Call")
    }
    
    func hangUp(){
        print("Hang up")
    }
}

//implimenting a protocol "ia-a" or "can-do"
class LandLineWPro: TelephoneProtocol{
    var phoneNum:Int
    init(phoneNum:Int){
        self.phoneNum = phoneNum
    }
}


//structs
//struct vs classes
    //structs can't inherit
    //structures can have memberwise initializer /memberwise init is an auto init
    //struct are value type NOT a refrence type


struct TelephoneStruct{
    var miles:Double
}

var disStruct = TelephoneStruct(miles: 22)


//Does the Distance type need to subclass? No, it doesn’t.
// Should there be only one Distance object? No, there can be more than one.
//Is the value equivalent to its identity? If you had two 100 km Distance objects,
//they should be treated as equivalent, so yes, the value is equivalent to identity.


//Extensions

extension Dictionary{
    func add(other:Dictionary)->Dictionary{
        var returnDictionary:Dictionary = self
        for (key, value) in other{
            returnDictionary[key] = value
        }
        return returnDictionary
    }
}

var somelanguages = ["eng":"English","esp":"Spanish","ita":"Italian"]
var moreLanguages = ["deu":"German","chi":"Chinese","fre":"French"]



var languages = somelanguages.add(other: moreLanguages)








//: [Next](@next)
