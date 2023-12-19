//
//  PADetailPresenter.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation

protocol PADetailPresenterProtocol: PAListPresenterProtocol {
    func getDetailPokemon(_ pokemon: PokemonModel?)
}

class PADetailPresenter {
    private weak var view: PADetailViewControllerProtocol!
    private var router: PAListRouterProtocol!
    private var interactor: PokemonInteractorProtocol!
    
    private var relatedPokemons = [PokemonModel]()
    
    init(view: PADetailViewControllerProtocol!, router: PAListRouterProtocol!, interactor: PokemonInteractorProtocol!) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension PADetailPresenter: PADetailPresenterProtocol {
    func didTapRelatedPokemonForRow(_ row: Int) {
        router.routeToDetail(pokemon: relatedPokemons[row])
    }
    
    func getPokedexCount() -> Int {
        relatedPokemons.count
    }
    
    func getPokemonForRow(_ row: Int) -> String {
        relatedPokemons[row].name
    }
    
    func didTapPokemonForRow(_ row: Int) {
        router.routeToDetail(pokemon: relatedPokemons[row])
    }
    
    func didLoad() {
        self.view.setupTable()
    }
    
    func getDetailPokemon(_ pokemon: PokemonModel?) {
        guard let pokemon = pokemon else { return }
        interactor.getPokemonDetail(url: pokemon.url) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                self.view.setupView(detail: response)
                self.fetchRelatedPokemon(url: response.urlType)
            case .failure(_):
                break
            }
        }
    }
    
}

extension PADetailPresenter {
    
    
    func fetchRelatedPokemon(url: String) {
        interactor.getPokemonRelated(url: url) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                self.relatedPokemons = response
                self.view.reloadData()
            case .failure(_):
                break
            }
        }
    }
}
