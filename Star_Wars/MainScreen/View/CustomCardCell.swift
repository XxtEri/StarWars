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
    
    private var modelView = ModelViewMainScreen()
    private var navigationController: UINavigationController? = nil
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

    func configure(with model: Card, numberCard: Int, _ navController: UINavigationController?) {
        titleCard.text = model.title
        titleCard.textColor = self.colors[numberCard]
        
        let image = UIImage(named: model.imageName)
        imageCard.image = image
        imageCard.layer.cornerRadius = 50
        imageCard.clipsToBounds = true

        self.navigationController = navController
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(request(paramSender:))))
    }
    
    @objc
    func request(paramSender: Any) {
        let view = ViewControllerCardScreen()
        
        switch titleCard.text {
        case TitleScreen.characters.rawValue:
            view.titleBlock = .characters
            print("characters")
        case TitleScreen.films.rawValue:
            view.titleBlock = .films
            print("films")
        case TitleScreen.planets.rawValue:
            view.titleBlock = .planets
            print("planets")
        case TitleScreen.species.rawValue:
            view.titleBlock = .species
            print("species")
        case TitleScreen.vehicles.rawValue:
            view.titleBlock = .vehicles
            print("vehicles")
        case TitleScreen.starships.rawValue:
            view.titleBlock = .starships
            print("starships")
        default:
            view.titleBlock = .non
            print("non")
        }
        
        modelView.fetch(title: view.titleBlock)
        view.elementsCardArray = modelView.arrayElementsBlock as Array<AnyObject>
        view.navigationItem.setHidesBackButton(false, animated: false)
        self.navigationController?.pushViewController(view, animated: true)
    }
}
