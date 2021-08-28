//: [Previous](@previous)

import Foundation

var arr1 = [1, 2, 3]
var arr2 = arr1

func address(o: UnsafeRawPointer) -> Int{
    return Int(bitPattern: o)
}

print("address of arr1 = \(address(o: &arr1))")
print("address of arr2 = \(address(o: &arr2))")
print("Modifying arr2")
arr2.append(4)
print("address of arr1 = \(address(o: &arr1))")
print("address of arr2 = \(address(o: &arr2))")



struct MediaItem{
    
    fileprivate class MediaData{
        var name:String = ""
        var  format:[String:String]
        
        init(name:String, format:[String:String]) {
            self.name = name
            self.format  = format
        }
    }
    
    private var data:MediaData
    
    init(name:String, format:[String:String]){
        data = MediaData.init(name: name, format: format)
    }
}

extension MediaItem{
    public var name:String{
        get {return data.name}
        set{
            if !isKnownUniquelyReferenced(&data){
                self.data = self.data.copy()
            }
            self.data.name = newValue
        }
    }
}


extension MediaItem.MediaData{
    func copy() -> MediaItem.MediaData{
        return MediaItem.MediaData.init(name: name, format: format)
    }
}





















//MARK: Swift Docs

let bytesPointer = UnsafeMutableRawPointer.allocate(byteCount: 4, alignment: 4)
bytesPointer.storeBytes(of: 0xFFFF_FFFF, as: UInt32.self)

// Load a value from the memory referenced by 'bytesPointer'
let x = bytesPointer.load(as: UInt8.self)       // 255

// Load a value from the last two allocated bytes
let offsetPointer = bytesPointer + 2
let y = offsetPointer.load(as: UInt16.self)     // 65535

//The code above stores the value 0xFFFF_FFFF into the four newly allocated bytes, and then loads the first byte as a UInt8 instance and the third and fourth bytes as a UInt16 instance.

//Always remember to deallocate any memory that you allocate yourself.

bytesPointer.deallocate()



func print<T>(address p: UnsafeRawPointer, as type: T.Type) {
    let value = p.load(as: type)
    print(value)
}


//let rawPointer: UnsafeRawPointer = ...
//print(address: rawPointer, as: Int.self)

//: [Next](@next)
