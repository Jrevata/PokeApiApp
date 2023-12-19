//
//  PADetailConfigurator.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation

protocol PADetailConfiguratorProtocol {
    func configure(controller: PADetailViewController)
}

class PADetailConfigurator: PADetailConfiguratorProtocol {
    func configure(controller: PADetailViewController) {
        controller.presenter = PADetailPresenter(view: controller,
                                                 router: PADetailRouter(withView: controller),
                                                 interactor: PokemonInteractor(repository: PokemonRepository()))
    }
}
