//
//  HomeInteractor.swift
//  Amiibo_Viper
//
//  Created by Uri on 6/12/22.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: - Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    
    var arrayAmiibo = [AmiiboForViewEntity]()   // to store converted Amiibos
    
    func interactorGetData() {                  // ask remoteDataManager to get data from our api call
        remoteDatamanager?.fetchAmiibos()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    
    // interactor receives raw data from remoteDataManager
    func remoteDataManagerCallBackData(with category: [Amiibo]) {
        // interactor converts data, from AmiiboEntity to AmiiboForViewEntity
        for amiibo in category {
            let amiiboForViewEntity = AmiiboForViewEntity(name: amiibo.name, gameSeries: amiibo.gameSeries, imageUrl: amiibo.image, count: 0)
            self.arrayAmiibo.append(amiiboForViewEntity)
        }
        // send converted data to presenter
        presenter?.interactorPushDataToPresenter(receivedData: self.arrayAmiibo)
    }
}
