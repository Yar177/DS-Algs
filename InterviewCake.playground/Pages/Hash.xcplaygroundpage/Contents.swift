//: [Previous](@previous)

import Foundation


func findMoview(flightLength: Int, movileLength: [Int]) -> Bool{
    var movieLengthSeen = Set<Int>()
    for firstMovieLength in movileLength{
        let matchingSecondMovieLength = flightLength - firstMovieLength
        if movieLengthSeen.contains(matchingSecondMovieLength){
            return true
        }
        movieLengthSeen.insert(firstMovieLength)
    }
    return false
}


func hasPalindromePremitation(in theString: String) -> Bool{
    var unpairedChars: Set<Character> = []
    for char in theString{
        if unpairedChars.contains(char){
            unpairedChars.remove(char)
        }else{
            unpairedChars.insert(char)
        }
    }
    return unpairedChars.count <= 1
}


func splitWords(in input: String) -> [String]{
    var words: [String] = []
    
    var currentWordIndex = input.startIndex
    var starttingNewWord = true
    
    for i in input.indices{
        let char = input[i]
        
        if char.isLetter(){
            if starttingNewWord{
                currentWordIndex = i
                starttingNewWord = false
            }
        }else{
            let range = currentWordIndex..<i
            let cuurentWord = String(input[range])
            words.append(cuurentWord)
            starttingNewWord = true
        }
    }
    return words
}
var str1 = "After beating the eggs, Dana read the next step:"
var str2 = "Add milk and eggs, then add flour and sugar."
debugPrint(splitWords(in: str1))
debugPrint(splitWords(in: str2))



extension Character{
    func isLetter() -> Bool{
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".contains(self)
    }
}

var wordsToCount: [String : Int] = [:]

func addWordsToDictionary(_ word: String){
    if let count = wordsToCount[word.lowercased()]{
        wordsToCount[word.lowercased()] = count + 1
    }else{
        wordsToCount[word] = 1
    }
}









//: [Next](@next)
