//
//  HomeView.swift
//  Amiibo_Viper
//
//  Created by Uri on 6/12/22.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {

    // MARK: Properties
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // communicate the view with the presenter
        presenter?.viewDidLoad()
        view.backgroundColor = .orange
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}
