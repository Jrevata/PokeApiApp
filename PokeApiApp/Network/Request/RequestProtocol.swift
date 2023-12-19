//
//  RequestProtocol.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Alamofire

protocol RequestObject {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var encoding: JSONEncoding { get }
    var parameters: Parameters { get set }
}
