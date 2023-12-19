//
//  PADetailViewController.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import UIKit
import SDWebImage

protocol PADetailViewControllerProtocol: AnyObject {
    func setupTable()
    func setupView(detail: PokemonDetailModel)
    func reloadData()
}

class PADetailViewController: UIViewController {

    @IBOutlet weak var nameLbl      : UILabel!
    @IBOutlet weak var typeLbl      : UILabel!
    @IBOutlet weak var statLbl      : UILabel!
    @IBOutlet weak var statValueLbl : UILabel!
    @IBOutlet weak var weightLbl    : UILabel!
    @IBOutlet weak var imageView    : UIImageView!
    @IBOutlet weak var tableView    : UITableView!
    
    private let configurator = PADetailConfigurator()
    
    var presenter: PADetailPresenterProtocol!
    var pokemon: PokemonModel?
    
    deinit {
        print("PADetailViewController \(pokemon?.name ?? "") deinit" )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(controller: self)
        presenter.didLoad()
        presenter.getDetailPokemon(pokemon)
    }

}

extension PADetailViewController: PADetailViewControllerProtocol {
    
    func setupTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupView(detail: PokemonDetailModel) {
        nameLbl.text = detail.name
        typeLbl.text = detail.type
        statLbl.text = detail.nameStat
        statValueLbl.text = "\(detail.valueStat)"
        weightLbl.text = "\(detail.weight)"
        imageView.sd_setImage(with: URL(string: detail.image))
        
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
}

extension PADetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getPokedexCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter.getPokemonForRow(indexPath.row)
        return cell
    }
    
    
}

extension PADetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapPokemonForRow(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
