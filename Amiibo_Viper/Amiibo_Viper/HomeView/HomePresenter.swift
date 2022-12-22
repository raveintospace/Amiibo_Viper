//
//  HomePresenter.swift
//  Amiibo_Viper
//
//  Created by Uri on 6/12/22.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    // array intermediate
}

extension HomePresenter: HomePresenterProtocol {
    
    func viewDidLoad() {
        interactor?.interactorGetData()
        view?.setup()
    }
    
    func showDetailView(with data: AmiiboForViewEntity) {
        wireFrame?.presentNewViewDetail(from: view!, withData: data)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // Receive data from Interactor and send it to view
    func interactorPushDataToPresenter(receivedData: [AmiiboForViewEntity]) {
        view?.presenterPushDataToView(receivedData: receivedData)
    }
}

// 3 model levels
// remove unused files
// class apiclient 
