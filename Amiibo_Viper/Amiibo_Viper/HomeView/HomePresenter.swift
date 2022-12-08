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
    
}

extension HomePresenter: HomePresenterProtocol {
    
    func viewDidLoad() {
        view?.setup()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // Receive data from Interactor and send it to view
    func interactorPushDataToPresenter(receivedData: [AmiiboForViewEntity]) {
        <#code#>
    }
}
