//
//  PADetailRouter.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation

class PADetailRouter {
    private weak var currentViewController: PADetailViewController?
    
    init(withView view: PADetailViewController) {
        self.currentViewController = view
    }
}

extension PADetailRouter: PAListRouterProtocol {
    func routeToDetail(pokemon: PokemonModel) {
        guard let currentView = currentViewController,
              let destination = currentView.storyboard?.instantiateViewController(withIdentifier: "PADetailViewController") as? PADetailViewController else { return }
        destination.pokemon = pokemon
        currentView.navigationController?.pushViewController(destination, animated: true)
    }
}
