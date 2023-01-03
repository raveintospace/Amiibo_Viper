//
//  DetailPresenter.swift
//  Amiibo_Viper
//
//  Created by Uri on 12/12/22.
//  
//

import Foundation

final class DetailPresenter: DetailPresenterProtocol  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var dataAmiiboReceived: AmiiboForDetailViewEntity?
    
    func viewDidLoad() {
        print("I'm the detail VC and I have: \(String(describing: dataAmiiboReceived?.name))")
        
        if let dataAmiiboReceived = dataAmiiboReceived {
            view?.setupDetailView()
            view?.showDataInDetailVC(data: dataAmiiboReceived)
        }
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
