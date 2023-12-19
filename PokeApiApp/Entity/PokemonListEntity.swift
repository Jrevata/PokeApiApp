//
//  PokemonListEntity.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation

struct PokemonListEntity: Codable {
    var results: [GenericInfoEntity]
    
    static func mapperPokemonListEntity(_ entity: PokemonListEntity) -> [PokemonModel] {
        return entity.results.map{ PokemonModel(name: $0.name, url: $0.url) }
    }
}

struct GenericInfoEntity: Codable {
    var name: String
    var url: String
}
