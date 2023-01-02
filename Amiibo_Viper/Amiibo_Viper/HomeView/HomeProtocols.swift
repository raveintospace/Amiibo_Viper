//
//  HomeProtocols.swift
//  Amiibo_Viper
//
//  Created by Uri on 6/12/22.
//  
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }
    func setup()
    func presenterPushDataToView(receivedData: [AmiiboForViewEntity])
}

protocol HomeWireFrameProtocol {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UINavigationController
    
    func presentNewViewDetail(from view: HomeViewProtocol, withData: AmiiboForViewEntity)
}

protocol HomePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showDetailView(with data: AmiiboForViewEntity)
}

protocol HomeInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func interactorPushDataToPresenter(receivedData: [AmiiboForViewEntity])
}

protocol HomeInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    
    func interactorGetData()
}

protocol HomeRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }
    func fetchAmiibos()
}

protocol HomeRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteDataManagerCallBackData(with category: [Amiibo])
}
