//
//  CustomPlanetCell.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import UIKit
import SnapKit

final class CustomPlanetCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CustomPlanetCell"
    
    lazy var imagePlanet: UIImageView = {
        var imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imagePlanet)
        self.layer.cornerRadius = 35
        self.layer.masksToBounds = true
        self.setConstraints()
        
        createAllowButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createAllowButton() {
        let allow = UIImageView(image: UIImage(named: "SimpleAllow"))
        allow.contentMode = .scaleAspectFit
        allow.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(pressAllow(paramSender:))))
        
        self.addSubview(allow)
        
        allow.snp.makeConstraints({ make in
            make.top.bottom.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(25.18)
        })
    }
    
    @objc
    func pressAllow(paramSender: UIImageView) {
        print("Press")
    }
    
    func setConstraints() {
        imagePlanet.snp.makeConstraints({ make in
            //make.top.trailing.leading.equalToSuperview().inset(14)
            make.edges.equalToSuperview()
        })
    }

    func configure(with model: Planet) {
        let image = UIImage(named: model.imageName)
        imagePlanet.image = image
        
    }

}
