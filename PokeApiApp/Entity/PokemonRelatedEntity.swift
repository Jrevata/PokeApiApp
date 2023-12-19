//
//  PokemonRelatedEntity.swift
//  PokeApiApp
//
//  Created by Jordan on 19/12/23.
//

import Foundation

struct PokemonRelatedListEntity: Codable {
    var pokemon: [PokemonRelatedEntity]
    
    static func mapperPokemonRelatedListEntity(_ entity: PokemonRelatedListEntity) -> [PokemonModel] {
        return entity.pokemon.map{ PokemonModel(name: $0.pokemon.name, url: $0.pokemon.url) }
    }
}

struct PokemonRelatedEntity: Codable {
    var pokemon: GenericInfoEntity
}
