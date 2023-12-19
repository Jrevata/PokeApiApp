//
//  AuthRepository.swift
//  PokeApiApp
//
//  Created by Jordan on 19/12/23.
//

import Foundation
protocol AuthRepositoryProtocol {
    func login(user: String, password: String)
}

class AuthRepository {
    
    private let dataSource: ServiceDataSourceProtocol
    
    init() {
        self.dataSource = ServiceDataSource()
    }
}

extension AuthRepository: AuthRepositoryProtocol {
    
    func login(user: String, password: String) {
        
        guard let usernameEncrypted = try? user.aesEncrypt(),
              let passwordEncrypted = try? password.aesEncrypt() else { return }
            
        let _ : [String: String] = [
            "username" : usernameEncrypted,
            "password" : passwordEncrypted
        ]
        //self.dataSource...
    }
    
    
}
