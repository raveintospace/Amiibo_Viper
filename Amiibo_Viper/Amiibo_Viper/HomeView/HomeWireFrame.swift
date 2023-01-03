//
//  HomeWireFrame.swift
//  Amiibo_Viper
//
//  Created by Uri on 6/12/22.
//  
//

import Foundation
import UIKit

final class HomeWireFrame: HomeWireFrameProtocol {

    static func createHomeModule() -> UINavigationController {
        let view =  HomeView()
        let navigationController = UINavigationController(rootViewController: view)
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
        let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
        let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        return navigationController
    }
    
    func presentNewViewDetail(from view: HomeViewProtocol, withData: AmiiboForDetailViewEntity) {
        let newDetailView = DetailWireFrame.createDetailModule(with: withData)
        
        let viewController = view as! HomeView
        viewController.navigationController?.pushViewController(newDetailView, animated: true)
    }
}

// https://www.youtube.com/watch?v=ruVZVFRbeas DetailView Viper Sergio
// https://betterprogramming.pub/how-to-implement-viper-architecture-in-your-ios-app-rest-api-and-kingfisher-f494a0891c43 - how to set up a navigationController without storyboards

