import UIKit

//MARK: Weak vs strong vs unowned
/*
 Capture lists come before a closure’s parameter list in your code, and capture values from the environment as either strong, weak, or unowned. We use them a lot, mainly to avoid strong reference cycles – aka retain cycles.
 
 The most common alternative to strong capturing is called weak capturing, and it changes two things:
 Weakly captured values aren’t kept alive by the closure, so they might be destroyed and be set to nil.
 As a result of 1, weakly captured values are always optional in Swift. This stops you assuming they are present when in fact they might not be.
 
 An alternative to weak is unowned, which behaves more like implicitly unwrapped optionals. Like weak capturing, unowned capturing allows values to become nil at any point in the future. However, you can work with them as if they are always going to be there – you don’t need to unwrap optionals.
 
 */


class Singer{
    func playSong(){
        print("Sing Sing Sing for year")
    }
}

func sing() -> () -> Void{
    let taylor = Singer()
    let singing = {
        taylor.playSong()
        return
    }
    return singing
}

let singFunction = sing()
singFunction()

func singWeak() -> () -> Void{
    let singer = Singer()
    
    let singing = { [weak singer] in
        singer?.playSong()
        return
    }
    
    return singing
}

let weeakSinging = singWeak()
weeakSinging()

func unownedSing() -> () -> Void{
    let singer = Singer()
    let singing = { [unowned singer] in
        singer.playSong()
        return
    }
    return singing
}

let unownerSinging = unownedSing()
//unownerSinging()

class House{
    var ownerDetails: (() -> Void)?
    func printDetails(){
        print("This is great house")
    }
    
    deinit{
        print("I'm being demolished")
    }
}

class Owner{
    var houseDetails: (() -> Void)?
    func printDetails(){
        print("Owner")
    }
    
    
    deinit{
        print("Owner is dying")
    }
}

































































