//
//  PAListConfigurator.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation

protocol PAListConfiguratorProtocol {
    func configure(controller: PAListViewController)
}

class PAListConfigurator: PAListConfiguratorProtocol {
    func configure(controller: PAListViewController) {
        controller.presenter = PAListPresenter(view: controller,
                                               router: PAListRouter(withView: controller), 
                                               interactor: PokemonInteractor(repository: PokemonRepository()))
    }
}
