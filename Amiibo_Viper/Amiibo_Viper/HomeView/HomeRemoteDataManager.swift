//
//  HomeRemoteDataManager.swift
//  Amiibo_Viper
//
//  Created by Uri on 6/12/22.
//  
//

import Foundation

struct APIClient {
    enum Method: String {
        case GET
        case POST
        case DELETE
        case PUT
        case PATCH
    }
    
    func request<T: Decodable>(url: URL, method: Method, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-www-form-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        
        session.dataTask(with: request) {(data, response, error) in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                    return
                }

                  fatalError("Data and error should never be nil both")
                }
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print("Getting from server: \(data)")
                
                let result = Result { try JSONDecoder().decode(T.self, from: data) }
                
                completion(result)
                
            } else {
                print("An error happened: TBD")
            }
        }.resume()
    }
}

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
        
    func fetchAmiibos() {      // call to our remote server to get data for our interactor
        APIClient().request(url: URL(string: "https://www.amiiboapi.com/api/amiibo")!,
                            method: .GET,
                            type: AmiiboEntity.self) { [remoteRequestHandler] result in
            switch result {
            case let .success(entity):
                remoteRequestHandler?.remoteDataManagerCallBackData(with: entity.amiibo)
            case .failure:
                break
            }
        }
    }
}
