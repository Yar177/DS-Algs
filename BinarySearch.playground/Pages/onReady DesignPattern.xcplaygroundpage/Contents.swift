//: [Previous](@previous)

import Foundation
import UIKit

class APICallers{
    static let shared = APICallers()
    private init(){}
    private var isReady = false
    typealias Complitiion = ((String) -> Void)
    private var blocks = [Complitiion]()
    
    func warmUp(){
        print("Warming up")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            print("Is ready")
            self.isReady = true
            self.blocks.forEach { callback in
                APICallers.shared.getData(complitiion: callback)
            }
        }
    }

    func getData(complitiion: @escaping Complitiion){
        guard isReady else {
            blocks.append(complitiion)
            return
        }
        complitiion("Was Ready")
    }
}

let apiCaller = APICallers.shared
apiCaller.warmUp()
apiCaller.getData{ string in
    print("String \(string)")
}

apiCaller.getData{ string in
    print("String \(string)")
}

apiCaller.getData{ string in
    print("String \(string)")
}


//: [Next](@next)
