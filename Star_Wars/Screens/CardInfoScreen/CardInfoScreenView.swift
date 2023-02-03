//
//  CardInfoScreenView.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

protocol ICardInfoScreenView: UIView {
    func setTitleScreen(titleScreen: String)
    func reloadCollectionView()
    func setupCollectionView(delegate: UICollectionViewDelegate, dataOutput: UICollectionViewDataSource)
}

class CardInfoScreenView: UIView {

    private enum Metrics {
        
    }
    
    lazy var titleScreenLabel: UILabel = {
        let label = UILabel()
        label.text = "HAHHA"
        label.textColor = .yellow
        label.textAlignment = .center
        label.font = UIFont(name: "Spartan", size: 35)
        
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .black
        
        view.register(CardInfoScreenCollectionViewCell.self, forCellWithReuseIdentifier: CardInfoScreenCollectionViewCell.reuseIdentifier)
        
        return view
    }()
    
    private var collectionViewDelegate: UICollectionViewDelegate?
    private var collectionViewDataOutput: UICollectionViewDataSource?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.titleScreenLabel)
        self.addSubview(self.collectionView)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardInfoScreenView: ICardInfoScreenView {
    func setTitleScreen(titleScreen: String) {
        self.titleScreenLabel.text = titleScreen
    }
    
    func reloadCollectionView() {
        self.collectionView.reloadData()
    }
    
    func setupCollectionView(delegate: UICollectionViewDelegate, dataOutput: UICollectionViewDataSource) {
        self.collectionViewDelegate = delegate
        self.collectionViewDataOutput = dataOutput
        
        self.collectionView.delegate = self.collectionViewDelegate
        self.collectionView.dataSource = self.collectionViewDataOutput
    }
}

private extension CardInfoScreenView {
    func setup() {
        self.configure()
        self.configureConstraints()
    }
    
    func configure() {
        self.backgroundColor = .systemBackground
    }
    
    func configureConstraints() {
        titleScreenLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(90)
            make.leading.trailing.equalToSuperview().inset(5)
            //make.bottom.equalTo(collectionView.snp.top).inset(-45)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleScreenLabel.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
