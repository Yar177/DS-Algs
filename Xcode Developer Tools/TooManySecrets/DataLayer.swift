import Foundation

class DataLayer<T> {
    var data = [T]()
    
    func rowTypeAt(_ index: Int) -> T {
        return data[index]
    }
    
    func append(_ data: T) {
        self.data = self.data + [data]
    }
    
    var count: Int {
        return data.count
    }
}
