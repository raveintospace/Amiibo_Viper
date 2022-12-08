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
    
    var arrayAmiibo = [AmiiboForViewEntity]()   // converted Amiibos
    
    func interactorGetData() {
        remoteDatamanager?.remoteGetData()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    
    // interactor has raw data from remoteDataManager
    func remoteDataManagerCallBackData(with category: [AmiiboEntity]) {
        // interactor sends converted data to the presenter, from AmiiboEntity to AmiiboForViewEntity
        for amiibo in category {
            let amiiboForViewEntity = AmiiboForViewEntity(name: amiibo.amiibo[0].name, gameSeries: amiibo.amiibo[0].gameSeries, imageUrl: amiibo.amiibo[0].image, count: 0)
            self.arrayAmiibo.append(amiiboForViewEntity)
        }
        // send converted data to presenter
        presenter?.interactorPushDataToPresenter(receivedData: self.arrayAmiibo)
    }
}
