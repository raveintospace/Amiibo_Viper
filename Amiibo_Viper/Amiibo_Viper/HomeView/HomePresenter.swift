//
//  HomePresenter.swift
//  Amiibo_Viper
//
//  Created by Uri on 6/12/22.
//  
//

import Foundation

final class HomePresenter  {
    
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
    
    func showDetailView(with data: AmiiboForDetailViewEntity) {
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
// remove unused files - uri
// class apiClient -- done
// separate view
// review private properties
// remove class unless weak var - uri

//1. Indicar el tipo de acceso a las funciones/variables
//2. Varias capas de modelado (data/domain/vista) - Done
//3. Separar los DataSources del la llamada (ApiClient) - done
//4. No deja clases, modelos vacíos o protocolos que no se usan - done
// agregar a alan como colaborador
