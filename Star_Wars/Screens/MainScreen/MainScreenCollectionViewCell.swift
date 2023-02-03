//
//  MainScreenCollectionViewCell.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

class MainScreenCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "MainScreenCollectionViewCell"
    
    private enum Metrics {
        
    }
    
    private let colorsCard: [UIColor] = [.red, .yellow,
                                     .white, .init(red: 0, green: 130, blue: 200, alpha: 1),
                                 .yellow, .red]
    
    lazy var titleCard: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Lexend-Bold", size: 16)
        label.textAlignment = .center
        label.backgroundColor = .black.withAlphaComponent(0.5)
        
        return label
    }()
    
    lazy var imageCard: UIImageView = {
        var imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageCard)
        self.addSubview(titleCard)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: MainScreenModel, numberCard: Int) {
        self.titleCard.text = model.title.rawValue.uppercased()
        titleCard.textColor = self.colorsCard[numberCard]
        
        imageCard.image = UIImage(named: model.imageName)
    }
}

private extension MainScreenCollectionViewCell {
    func setup() {
        self.configureConstraints()
    }
    
    func configureCard() {
        self.layer.cornerRadius = 50
        self.clipsToBounds = true
    }
    
    func configureConstraints() {
        imageCard.snp.makeConstraints({ make in
            make.top.bottom.trailing.leading.equalToSuperview()
        })
        
        titleCard.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(15)
        })
    }
}
