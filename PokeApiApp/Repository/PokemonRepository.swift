//
//  PokemonRepository.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation


protocol PokemonRepositoryProtocol {
    func getPokemonList(completion: @escaping(Swift.Result<[PokemonModel], Error>) -> Void)
    func getPokemonDetail(url: String, completion: @escaping(Swift.Result<PokemonDetailModel, Error>) -> Void)
    func getPokemonRelated(url: String, completion: @escaping(Swift.Result<[PokemonModel], Error>) -> Void)
}

class PokemonRepository {
    
    private let dataSource: ServiceDataSourceProtocol
    
    init() {
        self.dataSource = ServiceDataSource()
    }
}

extension PokemonRepository: PokemonRepositoryProtocol {
    
    func getPokemonList(completion: @escaping (Result<[PokemonModel], Error>) -> Void) {
        dataSource.getPokemonList(request: PokemonListRequest()) { result in
            switch result {
            case .success(let data):
                completion(
                    .success(
                        PokemonListEntity.mapperPokemonListEntity(data)
                    )
                )
            case .failure(_):
                break
            }
        }
    }
    
    func getPokemonDetail(url: String, completion: @escaping (Result<PokemonDetailModel, Error>) -> Void) {
        dataSource.getPokemonDetail(request: PokemonDetailRequest(url: url)) { result in
            switch result {
                
            case .success(let data):
                completion(
                    .success(PokemonDetailEntity.mapperPokemonDetailEntity(data))
                )
            case .failure(_):
                break
            }
            
        }
    }
    
    func getPokemonRelated(url: String, completion: @escaping(Swift.Result<[PokemonModel], Error>) -> Void) {
        
        dataSource.getPokemonRelated(request: PokemonRelatedRequest(url: url)) { result in
            switch result {
            case .success(let data):
                completion(
                    .success(PokemonRelatedListEntity.mapperPokemonRelatedListEntity(data))
                )
            case .failure(_):
                break
            }
            
        }
    }
    
    
}
