//
//  NetworkService.swift
//  SRP
//
//  Created by Artur on 18.11.2022.
//

import Foundation


class NetworkService {
    func request(urlString: String, completion: @escaping(Data?,Error?) -> Void){
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?,Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data,error)
            }
        }
    }
    
}
