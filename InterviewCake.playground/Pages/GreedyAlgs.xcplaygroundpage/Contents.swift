//: [Previous](@previous)

import Foundation


/*
 Apple stocks all day instead.
 
 
 */

func getMaxProfitBF(from stockPrice: [Int]) -> Int? {
    guard stockPrice.count >= 2 else{
        return nil
    }
    
    var minPirce = stockPrice[0]
    var maxProftit = stockPrice[1] - stockPrice[0]
    for currentPrice in stockPrice[1...]{
        let potentialProfit = currentPrice - minPirce
        
        maxProftit = max(maxProftit, potentialProfit)
        
        minPirce = min(minPirce, currentPrice)
    }
    return maxProftit
}
let stockPrices = [10, 7, 5, 8, 11, 9]

getMaxProfitBF(from: stockPrices)

/*
 
 Highest Product of 3
 Find the highest possible product that you can get by multiplying
 any 3 numbers from an input array.
 
 */

enum HighestProductError: Error, CustomStringConvertible{
    case lessThanThree
    
    var description: String{
        return "Less than 3 items"
    }
}

//keep track of the highest two and lowest two
//keep track of the highestPorductOf2 and lowerProductOf2
func highestPoserOf3(_ items:[Int]) throws -> Int{
    
    if items.count <= 3 {
        throw HighestProductError.lessThanThree
        //return items.reduce(1) {$0 * $1}
    }
    
    var highest = max(items[0], items[1])
    var lowest = min(items[0], items[1])
    
    var highestProdOf2 = items[0] * items[1]
    var lowstProdOf2 = items[0] * items[1]
    

    var highestProdOf3 = items[0] * items[1] * items[3]
    
    for i in 2..<items.count{
        let current = items[i]
        highestProdOf3 = max(highestProdOf3, highestProdOf2 * current, lowstProdOf2 * current)
        highestProdOf2 = max(highestProdOf2, highest * current, lowest * current)
        lowstProdOf2 = min(lowstProdOf2, lowest * current, highest * current)
        highest = max(highest, current)
        lowest = min(lowest, current)
    }
    return highestProdOf3
}

func swiftlyhighestPoserOf3(_ items: [Int]) -> Int{
    var i = items.sorted()
    return i[(i.count - 3)...].reduce(1) { $0 * $1
    }
}

var intArray = [2,2,1,4,2,1,4,6,1,1,5,7]

swiftlyhighestPoserOf3(intArray)
try highestPoserOf3(intArray)


/*
 You have an array of integers, and for each index
 you want to find the product of every integer except the integer at that index.
 */

var allIntProd = [1, 7, 3, 4]
var allIntProd1 = [1, 2, 6, 5, 9]
var allIntProd2 = [3, 1, 2, 6, 5, 4]
func getProductsOfAllIntsExceptAtIndex(_ items: [Int]) -> [Int]{
    
    guard items.count >= 2 else{
        return []
    }
    var productsBeefooreIndex = Array(repeating: 0, count: items.count)
    
    var productSoFar = 1
    for i in 0..<items.count{
        productsBeefooreIndex[i] = productSoFar
        productSoFar *= items[i]
    }
     
    productSoFar = 1
    for i in (0..<items.count).reversed(){
        productsBeefooreIndex[i] *= productSoFar
        productSoFar *= items[i]
    }
    
    
    return productsBeefooreIndex
}


print(getProductsOfAllIntsExceptAtIndex(allIntProd))
getProductsOfAllIntsExceptAtIndex(allIntProd1)
getProductsOfAllIntsExceptAtIndex(allIntProd2)


/*
 Cafe Order Checker
 Write a function to tell us if cafe customer orders are served in the same order they're paid for.

 */










































//: [Next](@next)
