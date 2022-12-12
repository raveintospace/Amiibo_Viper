//
//  DetailPresenter.swift
//  Amiibo_Viper
//
//  Created by Uri on 12/12/22.
//  
//

import Foundation

class DetailPresenter: DetailPresenterProtocol  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var dataAmiiboReceived: AmiiboForViewEntity?
    
    func viewDidLoad() {
        print("I'm the detail VC and I have: \(String(describing: dataAmiiboReceived?.name))")
        view?.setup()
    }
    
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
