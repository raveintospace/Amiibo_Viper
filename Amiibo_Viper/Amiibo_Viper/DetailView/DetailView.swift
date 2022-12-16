//
//  DetailView.swift
//  Amiibo_Viper
//
//  Created by Uri on 12/12/22.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {

    // MARK: - Properties
    var presenter: DetailPresenterProtocol?
    var amiiboInDetailView: AmiiboForViewEntity?
    
    var safeArea: UILayoutGuide!
    let imageIV = CustomImageView()
    let nameLabel = UILabel()
    let dismissButton = UIButton()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .black
    }
}

extension DetailView: DetailViewProtocol {
    
    func setup() {
        safeArea = view.layoutMarginsGuide
        setupImage()
        setupNameLabel()
        setupDismissButton()
    }
    
    func setupImage() {
        view.addSubview(imageIV)
        
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageIV.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50).isActive = true
        imageIV.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5).isActive = true  // half the size of the device screen
        imageIV.heightAnchor.constraint(equalTo: imageIV.widthAnchor).isActive = true   // same height as width
        
        imageIV.contentMode = .scaleAspectFit       // mantains the aspect
    }
    
    func setupNameLabel() {
        view.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: imageIV.bottomAnchor, constant: 10).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        nameLabel.textColor = .white
        nameLabel.font = UIFont(name: "Verdana-Bold", size: 18)
    }
    
    func setupDismissButton() {
        view.addSubview(dismissButton)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50).isActive = true
        dismissButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        dismissButton.setTitle("Dissmiss", for: .normal)
        dismissButton.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        
        dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
    }
    
    @objc func dismissAction() {
        self.dismiss(animated: true)
    }
    
    func showDataInDetailVC(data: AmiiboForViewEntity) {
        
    }
}
