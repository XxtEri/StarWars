//
//  CustomPlanetCell.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import UIKit
import SnapKit

class CustomPlanetCell: UICollectionViewCell {
    
    lazy var imagePlanet: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addSubview(imagePlanet)
        
        setConstraints()
    }
    
    func createAllowButton() {
        let allow = UIImageView(image: UIImage(named: "SimpleAllow"))
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
            make.trailing.leading.equalToSuperview().inset(14)
        })
    }

    func configure(with model: Planet) {
        let image = UIImage(named: model.imageName)
        imagePlanet.image = image
    }

}
