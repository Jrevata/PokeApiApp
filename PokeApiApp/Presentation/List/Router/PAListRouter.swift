//
//  PAListRouter.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation

protocol PAListRouterProtocol {
    func routeToDetail(pokemon: PokemonModel)
}

class PAListRouter {
    private weak var currentViewController: PAListViewController?
    
    init(withView view: PAListViewController) {
        self.currentViewController = view
    }
}

extension PAListRouter: PAListRouterProtocol {
    func routeToDetail(pokemon: PokemonModel) {
        guard let currentView = currentViewController,
              let destination = currentView.storyboard?.instantiateViewController(withIdentifier: "PADetailViewController") as? PADetailViewController else { return }
        destination.pokemon = pokemon
        currentView.navigationController?.pushViewController(destination, animated: true)
    }
}
