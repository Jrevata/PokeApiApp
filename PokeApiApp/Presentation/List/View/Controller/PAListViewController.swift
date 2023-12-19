//
//  PAListViewController.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import UIKit

protocol PAListViewControllerProtocol: AnyObject {
    func reloadData()
    func setupView()
}

class PAListViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var presenter: PAListPresenterProtocol!
    private let configurator = PAListConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokédex"
        configurator.configure(controller: self)
        presenter.didLoad()
    }

}

extension PAListViewController: PAListViewControllerProtocol {
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func setupView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}


extension PAListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getPokedexCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter.getPokemonForRow(indexPath.row)
        return cell
    }
}

extension PAListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapPokemonForRow(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
