import Foundation

class SpyCellPresenter {
    var spy: SpyDTO
    
    var age: Int { return Int(spy.age) }
    var name: String { return spy.name }
    var imageName: String { return spy.imageName }
    
    init(with spy: SpyDTO) {
        self.spy = spy
    }
}

