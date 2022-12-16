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
    
    var safeArea: UILayoutGuide!
    var imageIVTopAnchorConstant: NSLayoutConstraint!
    let imageIV = CustomImageView()
    let nameLabel = UILabel()
    let changeSizeButton = UIButton()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .black
    }
}

extension DetailView: DetailViewProtocol {
    
    func setupDetailView() {
        safeArea = view.layoutMarginsGuide
        setupImage()
        setupNameLabel()
        setupchangeSizeButton()
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
    
    func setupchangeSizeButton() {
        view.addSubview(changeSizeButton)
        
        changeSizeButton.translatesAutoresizingMaskIntoConstraints = false
        changeSizeButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50).isActive = true
        changeSizeButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        changeSizeButton.setTitle("Change Amiibo size", for: .normal)
        changeSizeButton.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        
        changeSizeButton.addTarget(self, action: #selector(changeSizeAction), for: .touchUpInside)
    }
    
    @objc func changeSizeAction() {
//        imageIV.transform = CGAffineTransform(scaleX: 2, y: 2)
//        imageIV.transform = CGAffineTransform(translationX: 0, y: 50)
        // https://blog.devgenius.io/how-to-animate-your-images-in-swift-ios-swift-guide-64de30ea616b
    }
    
    func showDataInDetailVC(data: AmiiboForViewEntity) {
        if let url = URL(string: data.imageUrl)
        {
            imageIV.loadImage(from: url)
        }
        nameLabel.text = data.name
    }
}
