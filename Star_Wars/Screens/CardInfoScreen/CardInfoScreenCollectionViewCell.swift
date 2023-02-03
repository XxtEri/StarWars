//
//  CardInfoScreenCollectionViewCell.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

class CardInfoScreenCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "CardInfoScreenCollectionViewCell"
    
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
    
    lazy var allowButton: UIImageView = {
        let image = UIImageView(image: UIImage(named: "SimpleAllow"))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imagePlanet)
        self.addSubview(titleCell)
        self.addSubview(allowButton)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: CardInfoScreenModel) {
        self.titleCell.text = model.titleName
    }
}

private extension CardInfoScreenCollectionViewCell {
    func setup() {
        self.configureElement()
        self.configureConstants()
        self.configureActions()
    }
    
    func configureElement() {
        self.layer.cornerRadius = 35
        self.layer.masksToBounds = true
    }
    
    func configureConstants() {
        imagePlanet.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        
        titleCell.snp.makeConstraints({ make in
            make.leading.top.bottom.equalToSuperview().inset(10)
            make.trailing.equalTo(self.allowButton.snp.leading).inset(10)
        })
        
        allowButton.snp.makeConstraints({ make in
            make.top.bottom.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(25.18)
        })
    }
    
    func configureActions() {
        self.allowButton.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(pressAllow(paramSender:))))
    }
    
    @objc
    func pressAllow(paramSender: UIImageView) {
        print("Press")
    }
}
