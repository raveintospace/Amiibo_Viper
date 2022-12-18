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
    let zoomButton = UIButton()
    
    var zoomActivated = false

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
        imageIV.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
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
        view.addSubview(zoomButton)
        
        zoomButton.translatesAutoresizingMaskIntoConstraints = false
        zoomButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50).isActive = true
        zoomButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        zoomButton.setTitle("Zoom in Amiibo", for: .normal)
        zoomButton.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        zoomButton.setTitleColor(.systemBlue, for: .normal)
        
        zoomButton.addTarget(self, action: #selector(zoomAction), for: .touchUpInside)
    }
    
    @objc func zoomAction() {
        if !self.zoomActivated {
            self.imageIV.transform = CGAffineTransform(scaleX: 1.9, y: 1.9)
            nameLabel.removeFromSuperview()
            self.zoomButton.setTitle("Zoom out Amiibo", for: .normal)
            zoomActivated = true
        } else {
            self.imageIV.transform = .identity
            setupNameLabel()
            self.zoomButton.setTitle("Zoom in Amiibo", for: .normal)
            zoomActivated = false
        }
    }
    
    func showDataInDetailVC(data: AmiiboForViewEntity) {
        if let url = URL(string: data.imageUrl)
        {
            imageIV.loadImage(from: url)
        }
        nameLabel.text = data.name
    }
}
