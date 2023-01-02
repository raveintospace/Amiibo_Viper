//
//  DetailProtocols.swift
//  Amiibo_Viper
//
//  Created by Uri on 12/12/22.
//  
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: DetailPresenterProtocol? { get set }
    func setupDetailView()
    func showDataInDetailVC(data: AmiiboForViewEntity)
}

protocol DetailWireFrameProtocol {
    // PRESENTER -> WIREFRAME
    static func createDetailModule(with data: AmiiboForViewEntity) -> UIViewController
}

protocol DetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var wireFrame: DetailWireFrameProtocol? { get set }
    var dataAmiiboReceived: AmiiboForViewEntity? { get set }
    
    func viewDidLoad()
}

protocol DetailInteractorOutputProtocol {
// INTERACTOR -> PRESENTER
}

protocol DetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: DetailInteractorOutputProtocol? { get set }
}
