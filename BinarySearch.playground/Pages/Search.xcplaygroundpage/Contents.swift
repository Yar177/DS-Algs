//: [Previous](@previous)

import Foundation

var greeting = "Hello, Search"
print(greeting)

enum Nucleatide: Character, Comparable{
    static func < (lhs: Nucleatide, rhs: Nucleatide) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case A = "A", C = "C", G = "G", T = "T"
}

typealias Codon = (Nucleatide, Nucleatide, Nucleatide)
typealias Gene = [Codon]

let geneSequence = "ACGTGGCTCTCTAACGTACGTACGTACGGGGTTTATATATACCCTAGGACTCCCTTT"

func stringToGene(_ s: String) -> Gene{
    var gene = Gene()
    for i in stride(from: 0, through: s.count, by: 3){
        guard (i + 2) < s.count else {return gene}
        if let n1 = Nucleatide.init(rawValue: s[s.index(s.startIndex, offsetBy: i)]),
           let n2 = Nucleatide.init(rawValue: s[s.index(s.startIndex, offsetBy: i + 1)]),
           let n3 = Nucleatide.init(rawValue: s[s.index(s.startIndex, offsetBy: i + 2)]){
            gene.append((n1, n2, n3))
        }
    }
    return gene
}

var gene = stringToGene(geneSequence)
print("\(gene)")



//MARK: 2.1.2. Linear search




















































































//: [Next](@next)
