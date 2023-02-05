//
//  CardInfoScreenCollectionViewCell.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

class CardInfoScreenCollectionViewCell: UICollectionViewCell {
    
    private enum Metrics {
        static let titleCellSize: CGFloat = 20
        static let cornerRadiusView: CGFloat = 35
        static let titleCellVerticalEdgesInset: CGFloat = 5
        static let titleCellLeadingInset: CGFloat = 10
        static let titleCellTrailingInset: CGFloat = 10
        static let allowImageViewVerticalEdgesInset: CGFloat = 24
        static let allowImageViewTrailingInset: CGFloat = 25.18
    }
    
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
        label.font = UIFont(name: TitleFonts.spartanFont, size: Metrics.titleCellSize)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var allowImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "SimpleAllow"))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imagePlanet)
        self.addSubview(titleCell)
        self.addSubview(allowImageView)
        
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
    }
    
    func configureElement() {
        self.layer.cornerRadius = Metrics.cornerRadiusView
        self.layer.masksToBounds = true
    }
    
    func configureConstants() {
        imagePlanet.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        
        titleCell.snp.makeConstraints({ make in
            make.verticalEdges.equalToSuperview().inset(Metrics.titleCellVerticalEdgesInset)
            make.leading.equalToSuperview().inset(Metrics.titleCellTrailingInset)
            make.trailing.equalTo(self.allowImageView.snp.leading).inset(Metrics.titleCellTrailingInset)
        })
        
        allowImageView.snp.makeConstraints({ make in
            make.verticalEdges.equalToSuperview().inset(Metrics.allowImageViewVerticalEdgesInset)
            make.trailing.equalToSuperview().inset(Metrics.allowImageViewTrailingInset)
        })
    }
}
