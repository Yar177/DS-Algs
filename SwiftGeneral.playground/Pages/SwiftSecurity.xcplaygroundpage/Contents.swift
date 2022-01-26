//: [Previous](@previous)

import Foundation
import Security


//Asymeteric crypto
enum KeychainError: Error{
    case keyGenarationError
}

class KeyChainFacade{
    
    private static let tagData = "com.asymriptodemo.keys.mkey".data(using: String.Encoding.utf8)!
    private let keyAttribute:[String : Any] = [kSecAttrType as String : kSecAttrKeyTypeRSA,
                                             kSecAttrKeySizeInBits as String: 2048,
                                             kSecAttrApplicationTag as String: tagData,
                                             kSecPrivateKeyAttrs as String: [kSecAttrIsPermanent as String: true]]
    
    private func generatePrivateKey() throws -> SecKey{
        guard let privateKey = SecKeyCreateRandomKey(keyAttribute as CFDictionary, nil) else {
            throw KeychainError.keyGenarationError
        }
        return privateKey
    }
    
    private func retrivePrivateKey() throws -> SecKey? {
        let privateKeyQuery: [String: Any] = [ kSecClass as String : kSecClassKey,
                                               kSecAttrApplicationTag as String : KeyChainFacade.tagData,
                                                      kSecAttrType as String : kSecAttrKeyTypeRSA]
    }
    
}



//: [Next](@next)
