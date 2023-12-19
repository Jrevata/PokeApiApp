//
//  PokemonListRequest.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation
import Alamofire

struct PokemonListRequest: RequestObject {
    let path: String = "pokemon?limit=151"
    let method: HTTPMethod = .get
    var headers: HTTPHeaders = [:]
    let encoding: JSONEncoding = .default
    var parameters: Parameters = [:]
    
    init() {
        
    }
    
    
}
