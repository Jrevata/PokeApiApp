//
//  PokemonInteractor.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation

protocol PokemonInteractorProtocol {
    func getPokemonList(completion: @escaping(Swift.Result<[PokemonModel], Error>) -> Void)
    func getPokemonDetail(url: String, completion: @escaping(Swift.Result<PokemonDetailModel, Error>) -> Void)
    func getPokemonRelated(url: String, completion: @escaping(Swift.Result<[PokemonModel], Error>) -> Void)
}

class PokemonInteractor: Interactor, PokemonInteractorProtocol {
    func getPokemonList(completion: @escaping (Result<[PokemonModel], Error>) -> Void) {
        (self.repository as? PokemonRepositoryProtocol)?.getPokemonList { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(_):
                break
            }
        }
    }
    
    func getPokemonDetail(url: String, completion: @escaping (Result<PokemonDetailModel, Error>) -> Void) {
        (self.repository as? PokemonRepositoryProtocol)?.getPokemonDetail(url: url) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(_):
                break
            }
        }
    }
    
    func getPokemonRelated(url: String, completion: @escaping(Swift.Result<[PokemonModel], Error>) -> Void) {
        (self.repository as? PokemonRepositoryProtocol)?.getPokemonRelated(url: url) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(_):
                break
            }
        }
    }
    
}
