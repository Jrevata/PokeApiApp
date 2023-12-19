//
//  Configuration.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation

 public protocol Configuration {
    static var serverBaseUrl: String { get }
    static var key: String { get }
    static var iV: String { get }
    static var keyDecrypt: String { get }
    static var ivDecrypt: String { get }
}

struct ProductionConfig: Configuration {
    static var serverBaseUrl = "https://pokeapi.co/api/v2/"
    static let key = "keyencuestion"
    static let iV = "keyencuestion"
    static let keyDecrypt = "keyencuestion"
    static let ivDecrypt = "keyencuestion"
}
