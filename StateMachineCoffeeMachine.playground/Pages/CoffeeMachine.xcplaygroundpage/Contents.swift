import Foundation

fileprivate protocol CoffeeMachineState {
    func isReadyToBrew() -> Bool
    func brew()
}

extension CoffeeMachineState{
    func isReadyToBrew() -> Bool{
        print("\(#function) not implimented for \(self) state")
        return false
    }
    
    func brew(){
        print("\(#function) not implimented for \(self) state")
    }
}


fileprivate struct StandbyState: CoffeeMachineState{
    
}

fileprivate struct FillWaterTankStatte: CoffeeMachineState{
    var context: CoffeeMachine
    
    func isReadyToBrew() -> Bool {
        guard context.isWaterTankFilled else{
            print("Fill Water Tank")
            context.state = StandbyState()
            return false
        }
        context.state = EptyCapusleBinStatte(context: context)
        return context.state.isReadyToBrew()
    }
    
}

struct EptyCapusleBinStatte: CoffeeMachineState{
    var context: CoffeeMachine
    
    func isReadyToBrew() -> Bool {
        guard context.isCapsuleBinEmpty else{
            print("no capsule")
            context.state = StandbyState()
            return false
        }
        context.state = InsurtCapsuleStatte(context: context)
        return context.state.isReadyToBrew()
    }

}

struct InsurtCapsuleStatte: CoffeeMachineState{
    var context: CoffeeMachine
    
    func isReadyToBrew() -> Bool {
        guard context.isCapsuleInserted else{
            print("insert coffee copsule")
            context.state = StandbyState()
            return false
        }
        return true
    }

}

struct BrewCoffeeStatte: CoffeeMachineState{
    var context: CoffeeMachine
    func brew() {
        context.state = FillWaterTankStatte(context: context)
        guard context.state.isReadyToBrew() else {
            print("Something went wrong")
            context.state = StandbyState()
            return
        }
        print("Coffee ready")
        context.state = StandbyState()
    }

}

class CoffeeMachine {
    fileprivate var isWaterTankFilled: Bool
    fileprivate var isCapsuleBinEmpty: Bool
    fileprivate var isCapsuleInserted: Bool
    
    fileprivate var state: CoffeeMachineState = StandbyState()
    
    
    required init(waterFilled: Bool, binEmpty: Bool, capsuleInserted: Bool) {
        isWaterTankFilled = waterFilled
        isCapsuleBinEmpty = binEmpty
        isCapsuleInserted = capsuleInserted
    }
    
    func brew() {
        state = BrewCoffeeStatte(context: self)
        state.brew()
        
    }
}

let coffeeMachine = CoffeeMachine(waterFilled: true, binEmpty: true, capsuleInserted: true)
coffeeMachine.brew()
