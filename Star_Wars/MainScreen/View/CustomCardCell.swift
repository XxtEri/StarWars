//
//  CollectionViewCell.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import UIKit
import SnapKit

class CustomCardCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CusromCardCell"
    
    private let colors: [UIColor] = [.red, .yellow,
                                     .white, .blue,
                                 .yellow, .red]
    
    lazy var titleCard: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: label.font.fontName, size: 20)
        label.textAlignment = .center
        label.backgroundColor = .black.withAlphaComponent(0.5)
        
        return label
    }()
    
    lazy var imageCard: UIImageView = {
        var imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageCard)
        self.addSubview(titleCard)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(request(paramSender:))))
    }
    
    @objc
    func request(paramSender: Any) {
        switch titleCard.text {
        case titleScreen.characters.rawValue:
            print("characters")
        case titleScreen.films.rawValue:
            print("films")
        case titleScreen.planets.rawValue:
            print("planets")
        case titleScreen.species.rawValue:
            print("species")
        case titleScreen.vehicles.rawValue:
            print("vehicles")
        default:
            print("non")
        }
    }

}
