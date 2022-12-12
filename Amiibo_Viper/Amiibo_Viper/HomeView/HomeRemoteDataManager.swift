//
//  HomeRemoteDataManager.swift
//  Amiibo_Viper
//
//  Created by Uri on 6/12/22.
//  
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    
    var getAmiibo = [Amiibo]()  // to store the data we got after calling our remote server
    
    func remoteGetData() {      // call to our remote server to get data for our interactor
        
        let session = URLSession.shared
        
        var request = URLRequest(url: URL(string: "https://www.amiiboapi.com/api/amiibo")!)
        
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-www-form-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        
        session.dataTask(with: request) {(data, response, error) in
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else {
                print("Connection error: \(error!)")
                return
            }
            if response.statusCode == 200{
                print("Getting from server: \(data)")
                
                do {
                    let decoder = JSONDecoder()
                    
                    self.getAmiibo = try decoder.decode(AmiiboEntity.self, from: data).amiibo
                    print("fato superat")
                    
                    // send data to interactor
                    self.remoteRequestHandler?.remoteDataManagerCallBackData(with: self.getAmiibo)
                    
                } catch {
                    print("Parsing error, error: \(error)")
                }
                
            } else {
                print("An error happened: \(response.statusCode)")
            }
        }.resume()
    }
    
}
