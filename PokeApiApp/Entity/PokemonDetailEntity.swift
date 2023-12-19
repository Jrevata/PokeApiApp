//
//  PokemonEntity.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//


import Foundation

struct PokemonDetailEntity: Codable {
    
    var name    : String
    var weight  : Int
    var sprites : SpriteEntity
    var stats   : [StatEntity]
    var types   : [TypeEntity]
    
    static func mapperPokemonDetailEntity(_ entity: PokemonDetailEntity) -> PokemonDetailModel {
        return PokemonDetailModel(name: entity.name,
                                  valueStat: entity.stats.first?.base_stat ?? 0,
                                  nameStat: entity.stats.first?.stat.name ?? "",
                                  image: entity.sprites.front_default ?? "",
                                  type: entity.types.first?.type.name ?? "",
                                  weight: entity.weight,
                                  urlType: entity.types.first?.type.url ?? "")
    }
    
}

struct SpriteEntity: Codable {
    var back_default: String?
    var back_shiny: String?
    var front_default: String?
    var front_shiny: String?
}

struct StatEntity: Codable {
    var base_stat: Int
    var stat: GenericInfoEntity
}

struct TypeEntity: Codable {
    var slot: Int
    var type: GenericInfoEntity
}
