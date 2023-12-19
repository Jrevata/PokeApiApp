//
//  Configuration.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation

 public protocol Configuration {
    static var serverBaseUrl: String { get }
}

struct ProductionConfig: Configuration {
    static var serverBaseUrl = "https://pokeapi.co/api/v2/"
}
