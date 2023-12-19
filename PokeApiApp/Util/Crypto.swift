//
//  Crypto.swift
//  PokeApiApp
//
//  Created by Jordan on 19/12/23.
//

import Foundation
import CryptoSwift

extension String {
    
    func aesEncrypt() throws -> String {
        
        let iVbase64Encoded = AppEnvironment.configuration.iV
        let iVdecodedData = Data(base64Encoded: iVbase64Encoded)!
        let iVdecodedString = String(data: iVdecodedData, encoding: .utf8)!
        
        let keyBase64Encoded = AppEnvironment.configuration.key
        let keyDecodedData = Data(base64Encoded: keyBase64Encoded)!
        let keyDecodedString = String(data: keyDecodedData, encoding: .utf8)!

        let ivData = Array((iVdecodedString).utf8)
        let gcm = GCM(iv: ivData, additionalAuthenticatedData: nil, tagLength: 16 * 8, mode: .combined)
        let aes = try AES(key: Array((keyDecodedString).utf8), blockMode: gcm, padding: .noPadding)
        let encrypted = try aes.encrypt(Array(self.utf8))
        let encryptedReturn = Data(encrypted).base64EncodedString()
        
        return encryptedReturn
    }
    
    func aesDecrypt() throws -> String {
        let ivData = Array((AppEnvironment.configuration.ivDecrypt).utf8)
        let gcm = GCM(iv: ivData, mode: .combined)
        let aes = try AES(key: Array((AppEnvironment.configuration.keyDecrypt).utf8), blockMode: gcm, padding: .noPadding)

        let result = try self.decryptBase64ToString(cipher: aes)
        return result
        
    }

}
