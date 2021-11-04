//: [Previous](@previous)

import Foundation
/*
 Subscript are used as a shortcut for accessing the member element in a collection
 
 */
struct TimeTablee{
    let multiplier: Int
    subscript(index: Int) -> Int{
        multiplier * index
    }
}
let threeTimeTablee = TimeTablee(multiplier: 3)
print("six time three is \(threeTimeTablee[6])")


struct Matrix {
    let rows: Int , columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int){
        self.rows = rows
        self.columns = columns
        self.grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool{
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double{
        get{
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set{
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}


var matrix = Matrix(rows: 2, columns: 2)
matrix[0,1] = 1.5
matrix[1,0] = 3.2

print(matrix)

//MARK: Type subscript
enum Planet: Int{
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet{
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
print(mars)








/*
 Variadic Parameters
 */
func arithmeticMean( _ numbers: Double...) -> Double{
    var total: Double = 0
    for number in numbers{
        total += number
    }
    return total / Double(numbers.count)
}

print(arithmeticMean(1, 2,3,4,5))


/*
func with miltiple returns
 */
func minMax(_ array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array.min() ?? 0
    var currentMax = array.max() ?? 0
    return (currentMin, currentMax)
}

let intArray = [1, 2,3,4,5]

print(minMax(intArray).min)



























//: [Next](@next)
