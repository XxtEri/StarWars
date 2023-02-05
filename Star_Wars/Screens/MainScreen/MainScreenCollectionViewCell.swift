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
        static let titleCardSize: CGFloat = 16
        static let alphaComponent: CGFloat = 0.5
        static let cornerRadiusView: CGFloat = 50
        static let titleCardBottomInset: CGFloat = 15
    }
    
    private let colorsCard: [UIColor] = [.red, .yellow,
                                     .white, .init(red: 0, green: 130, blue: 200, alpha: 1),
                                 .yellow, .red]
    
    lazy var titleCard: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: TitleFonts.lexendBoldFont, size: Metrics.titleCardSize)
        label.textAlignment = .center
        label.backgroundColor = .black.withAlphaComponent(Metrics.alphaComponent)
        
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
        self.configureCard()
        self.configureConstraints()
    }
    
    func configureCard() {
        self.layer.cornerRadius = Metrics.cornerRadiusView
        self.clipsToBounds = true
    }
    
    func configureConstraints() {
        imageCard.snp.makeConstraints({ make in
            make.top.bottom.trailing.leading.equalToSuperview()
        })
        
        titleCard.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(Metrics.titleCardBottomInset)
        })
    }
}
