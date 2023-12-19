//
//  PAListPresenter.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation

protocol PAListPresenterProtocol {
    func didLoad()
    func getPokedexCount() -> Int
    func getPokemonForRow(_ row: Int) -> String
    func didTapPokemonForRow(_ row: Int)
}

class PAListPresenter {
    
    private weak var view: PAListViewControllerProtocol!
    private var router: PAListRouterProtocol!
    private var interactor: PokemonInteractorProtocol!
    
    private var pokemons = [PokemonModel]()
    
    init(view: PAListViewControllerProtocol!,
         router: PAListRouterProtocol!,
         interactor: PokemonInteractorProtocol!) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension PAListPresenter: PAListPresenterProtocol {
    func getPokedexCount() -> Int {
        return pokemons.count
    }
    
    func getPokemonForRow(_ row: Int) -> String {
        return pokemons[row].name.capitalized
    }
    
    func didLoad() {
        view.setupView()
        fetchPokedex()
    }
    
    func didTapPokemonForRow(_ row: Int) {
        router.routeToDetail(pokemon: pokemons[row])
    }
}

extension PAListPresenter {
    func fetchPokedex() {
        interactor.getPokemonList { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                self.pokemons = response
                self.view.reloadData()
            case .failure(_):
                break
            }
        }
    }
}
