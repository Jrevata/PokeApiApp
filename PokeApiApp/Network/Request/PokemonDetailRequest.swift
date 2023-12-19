//
//  PokemonDetailRequest.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation
import Alamofire

struct PokemonDetailRequest: RequestObject {
    var path: String = ""
    let method: HTTPMethod = .get
    var headers: HTTPHeaders = [:]
    let encoding: JSONEncoding = .default
    var parameters: Parameters = [:]
    
    init(url: String) {
        path = url
        headers["Authorization"] = AuthToken.getAccessToken()
        headers["Refresh-token"] = AuthToken.getRefreshToken()
    }
    
    
}
