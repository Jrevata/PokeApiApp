//
//  Environment.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation

public enum Environment: String {
    case Production = "com.jordanrevata.PokeApiApp"
    //. dev
    //. calidad
}

public extension Environment {
    
    var configuration: Configuration.Type {
        switch self {
        case .Production: return ProductionConfig.self
        }
    }
}

public let AppEnvironment: Environment = {
    
    let environment = Environment(rawValue: Bundle.main.bundleIdentifier ?? "")
    switch environment {
    case .Production:
        return Environment.Production
    default:
        fatalError("Environment Dont Exist")
    }
    
}()
