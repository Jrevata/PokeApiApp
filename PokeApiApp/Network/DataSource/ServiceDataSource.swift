//
//  ServiceDataSource.swift
//  PokeApiApp
//
//  Created by Jordan on 18/12/23.
//

import Foundation
import Alamofire

class ServiceDataSource {
    
    private var sessionManager: Session?
    
    init() {
        let configurator = URLSessionConfiguration.default
        configurator.timeoutIntervalForRequest = 180
        configurator.timeoutIntervalForRequest = 180
        let serverTrustPolicies = ServerTrustManager(evaluators: [
            "pokeapi.co" : PinnedCertificatesTrustEvaluator()
        ])
       
        self.sessionManager = Alamofire.Session(serverTrustManager: serverTrustPolicies)
    }
    
}

extension ServiceDataSource: ServiceDataSourceProtocol {
    
    func getPokemonList(request: RequestObject, completion: @escaping (Result<PokemonListEntity, Error>) -> Void) {
        guard let request = request as? PokemonListRequest else { return }
        let baseURL = AppEnvironment.configuration.serverBaseUrl
        print("URL: ", baseURL + request.path)
        sessionManager?.request(baseURL + request.path,
                                method: request.method,
                                encoding: request.encoding,
                                headers: request.headers).validate().response { response in
            let resstr = NSString(data: response.data ?? Data(), encoding:  String.Encoding.utf8.rawValue)
            
            debugPrint(resstr ?? "")
            switch response.result {
            case .success(let data):
                guard let data = data,
                      let dataResponse = try? JSONDecoder().decode(PokemonListEntity.self, from: data) else { return }
                completion(.success(dataResponse))
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    func getPokemonDetail(request: RequestObject, completion: @escaping (Result<PokemonDetailEntity, Error>) -> Void) {
        guard let request = request as? PokemonDetailRequest else { return }
        
        sessionManager?.request(request.path,
                                method: request.method,
                                encoding: request.encoding,
                                headers: request.headers).validate().response { response in
            switch response.result {
            case .success(let data):
                guard let data = data,
                      let dataResponse = try? JSONDecoder().decode(PokemonDetailEntity.self, from: data) else { return }
                completion(.success(dataResponse))
            case .failure(_):
                break
            }
        }
    }
    
    func getPokemonRelated(request: RequestObject, completion: @escaping (Result<PokemonRelatedListEntity, Error>) -> Void) {
        guard let request = request as? PokemonRelatedRequest else { return }
        sessionManager?.request(request.path,
                                method: request.method,
                                encoding: request.encoding,
                                headers: request.headers).validate().response { response in
            let resstr = NSString(data: response.data ?? Data(), encoding:  String.Encoding.utf8.rawValue)
            
            debugPrint(resstr ?? "")
            switch response.result {
            case .success(let data):
                guard let data = data,
                      let dataResponse = try? JSONDecoder().decode(PokemonRelatedListEntity.self, from: data) else { return }
                completion(.success(dataResponse))
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
}
