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

    // MARK: - Properties
    var presenter: HomePresenterProtocol?
    var tableView = UITableView()
    var safeArea: UILayoutGuide!
    var arrayViewAmiibo = [AmiiboForViewEntity]()   // stores data received from presenter

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // communicate the view with the presenter
        presenter?.viewDidLoad()
        view.backgroundColor = .orange
    }
}

// MARK: - Extensions

extension HomeView: HomeViewProtocol {

    func setup() {
        safeArea = view.layoutMarginsGuide
        tableView.dataSource = self
        tableView.register(AmiiboCell.self, forCellReuseIdentifier: "cellId")
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func presenterPushDataToView(receivedData: [AmiiboForViewEntity]) {
        arrayViewAmiibo = receivedData
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayViewAmiibo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let amiibo = arrayViewAmiibo[indexPath.row]
        
        guard let amiiboCell = cell as? AmiiboCell else { return cell }
        amiiboCell.nameLabel.text = amiibo.name
        amiiboCell.gameSeriesLabel.text = amiibo.gameSeries
        amiiboCell.countLabel.text = String(amiibo.count)
        
        if let url = URL(string: amiibo.imageUrl) {
            amiiboCell.imageIV.loadImage(from: url)
        }
        return cell
    }
}
