//
//  AuthToken.swift
//  PokeApiApp
//
//  Created by Jordan on 19/12/23.
//

import Foundation

class AuthToken {
    
    static func saveTokens(fromHeader header:[AnyHashable : Any]?) {
        
        guard let header = header else{return}
        guard let authToken = header["Authorization"] as? String else{return }
        print("SET TOKEN",authToken)
//        BMStorage.standard.set(authToken, forKey: Key.accessToken.rawValue, andLevel: .keychainNonPersistence)
        
        
    }
    
    static func getAccessToken() -> String {
//        guard let accessToken =  BMStorage.standard.string(forKey: Key.accessToken.rawValue, andLevel: .keychainNonPersistence) else  {return ""}
//        print("GET TOKEN",accessToken)
//        return accessToken
        return ""
    }
    
    static func getRefreshToken() -> String {
//        guard let accessToken =  BMStorage.standard.string(forKey: Key.refreshToken.rawValue, andLevel: .keychainNonPersistence) else  {return ""}
//        print("GET REFRESH TOKEN",accessToken)
//        return accessToken
        return ""
    }
    
   
}
