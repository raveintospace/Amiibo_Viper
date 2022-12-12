//
//  DetailInteractor.swift
//  Amiibo_Viper
//
//  Created by Uri on 12/12/22.
//  
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: DetailInteractorOutputProtocol?
    var localDatamanager: DetailLocalDataManagerInputProtocol?
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol?

}

extension DetailInteractor: DetailRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
