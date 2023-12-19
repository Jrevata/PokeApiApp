//
//  PokemonRelatedRequest.swift
//  PokeApiApp
//
//  Created by Jordan on 19/12/23.
//

import Foundation
import Alamofire

struct PokemonRelatedRequest: RequestObject {
    var path: String = ""
    let method: HTTPMethod = .get
    var headers: HTTPHeaders = [:]
    let encoding: JSONEncoding = .default
    var parameters: Parameters = [:]
    
    init(url: String) {
        path = url
    }
    
    
}
