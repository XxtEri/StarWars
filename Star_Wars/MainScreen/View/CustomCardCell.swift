//
//  CollectionViewCell.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import UIKit
import SnapKit

class CustomCardCell: UICollectionViewCell {
    
    private let colors: [UIColor] = [.red, .yellow,
                                     .white, .black,
                                 .yellow, .red]
    
    lazy var titleCard: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: label.font.fontName, size: 30)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var imageCard: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addSubview(imageCard)
        self.addSubview(titleCard)
        
        setConstraints()
    }
    
    func setConstraints() {
        imageCard.snp.makeConstraints({ make in
            make.top.bottom.trailing.leading.equalToSuperview()
        })
        
        titleCard.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(15)
        })
    }

    func configure(with model: Card, numberCard: Int) {
        titleCard.text = model.title
        titleCard.textColor = self.colors[numberCard]
        
        let image = UIImage(named: model.imageName)
        imageCard.image = image
        imageCard.layer.cornerRadius = 50
        imageCard.clipsToBounds = true
    }
}
