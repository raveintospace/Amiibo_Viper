//
//  DetailWireFrame.swift
//  Amiibo_Viper
//
//  Created by Uri on 12/12/22.
//  
//

import Foundation
import UIKit

final class DetailWireFrame: DetailWireFrameProtocol {
    
    static func createDetailModule(with data: AmiiboForDetailViewEntity) -> UIViewController {
        let view = DetailView()
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let interactor: DetailInteractorInputProtocol = DetailInteractor()
        let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        presenter.dataAmiiboReceived = data // the data imported when creating the detailModule
        interactor.presenter = presenter
        
        return view
    }
    
}
