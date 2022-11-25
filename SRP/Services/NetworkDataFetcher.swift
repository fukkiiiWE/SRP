//
//  NetworkDataFetcher.swift
//  SRP
//
//  Created by Artur on 18.11.2022.
//

import Foundation


class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    init(networkService: NetworkService = NetworkService()){
        self.networkService = networkService
    }
    
    func fetchGames(urlString: String, completion: @escaping (AppGroup?) -> Void){
        networkService.request(urlString: urlString) { data, error in
            let decoder = JSONDecoder()
            guard let data = data else {return}
            let response = try? decoder.decode(AppGroup.self, from: data)
            completion(response)
        }
    }
    func fetchCountry(urlString: String, completion: @escaping ([Country]?) -> Void){
        networkService.request(urlString: urlString) { data, error in
            let decoder = JSONDecoder()
            guard let data = data else {return}
            let response = try? decoder.decode([Country].self, from: data)
            completion(response)
        }
    }
    
    func fetchGenericJSONData<T:Decodable>(urlString: String, response: @escaping (T?) -> Void) {
        print(T.self)
        networkService.request(urlString: urlString) { data, error in
            if let error = error {
                print(error.localizedDescription)
                response(nil)
            }
            let decoded = self.decodeJSON(type: T.self, from: data)
            response(decoded)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil}
        do {
            let objects = try? decoder.decode(type.self, from: data)
            return objects
            
        } catch let jsonError {
            print("Failed to decode JSON",jsonError)
            return nil
            
        }
    }
    
    
    
}
