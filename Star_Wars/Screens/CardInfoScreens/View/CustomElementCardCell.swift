//
//  CustomPlanetCell.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import UIKit
import SnapKit

final class CustomElementCardCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CustomPlanetCell"
    
    lazy var imagePlanet: UIImageView = {
        var imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var titleCell: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: label.font.fontName, size: 24)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var allow: UIImageView = {
        let image = UIImageView(image: UIImage(named: "SimpleAllow"))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imagePlanet)
        self.addSubview(titleCell)
        self.addSubview(allow)
        
        createAllowButton()
        
        self.setLayerParameters()
        self.setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createAllowButton() {
        allow.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(pressAllow(paramSender:))))
    }
    
    @objc
    func pressAllow(paramSender: UIImageView) {
        print("Press")
    }
    
    func setConstraints() {
        imagePlanet.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        
        titleCell.snp.makeConstraints({ make in
            make.leading.top.bottom.equalToSuperview().inset(10)
            make.trailing.equalTo(self.allow.snp.leading).inset(10)
        })
        
        allow.snp.makeConstraints({ make in
            make.top.bottom.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(25.18)
        })
    }

    func setLayerParameters() {
        self.layer.cornerRadius = 35
        self.layer.masksToBounds = true
    }
    
    func configure(with model: Film) {
//        switch titleBlock {
//        case .films:
//            self.titleCell.text = model.name
//        case .characters:
//            print("")
//        case .planets:
//            print("")
//        case .species:
//            print("")
//        case .starships:
//            print("")
//        case .vehicles:
//            print("")
//        case .non:
//            print("")
//        }
        self.titleCell.text = model.name
    }

    func configure(with model: Planet) {
        self.titleCell.text = model.name
    }
}
