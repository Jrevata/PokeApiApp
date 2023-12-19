//
//  ServiceDataSourceProtocol.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation

protocol ServiceDataSourceProtocol {
    func getPokemonList(request: RequestObject, completion: @escaping(Swift.Result<PokemonListEntity, Error>) -> Void)
    func getPokemonDetail(request: RequestObject, completion: @escaping(Swift.Result<PokemonDetailEntity, Error>) -> Void)
    func getPokemonRelated(request: RequestObject, completion: @escaping(Swift.Result<PokemonRelatedListEntity, Error>) -> Void)
}
