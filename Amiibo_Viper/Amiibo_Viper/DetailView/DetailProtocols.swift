//
//  DetailProtocols.swift
//  Amiibo_Viper
//
//  Created by Uri on 12/12/22.
//  
//

import Foundation
import UIKit

protocol DetailViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: DetailPresenterProtocol? { get set }
    func setup()
}

protocol DetailWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createDetailModule(with data: AmiiboForViewEntity) -> UIViewController
}

protocol DetailPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var wireFrame: DetailWireFrameProtocol? { get set }
    var dataAmiiboReceived: AmiiboForViewEntity? { get set }
    
    func viewDidLoad()
}

protocol DetailInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol DetailInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: DetailInteractorOutputProtocol? { get set }
    var localDatamanager: DetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol? { get set }
}

protocol DetailDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol DetailRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol? { get set }
}

protocol DetailRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol DetailLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
