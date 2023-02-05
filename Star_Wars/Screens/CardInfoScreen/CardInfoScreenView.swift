//
//  CardInfoScreenView.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

protocol ICardInfoScreenView: UIView {
    func setTitleScreen(titleScreen: String)
    func reloadCollectionViewData()
    func setupCollectionView(delegate: UICollectionViewDelegate, dataOutput: UICollectionViewDataSource)
}

class CardInfoScreenView: UIView {

    private enum Metrics {
        static let titleScreenSize: CGFloat = 35
        static let titleScreenHorizontalEdgesInset: CGFloat = 5
        static let collectionViewTopInset: CGFloat = -45
        static let collectionViewHorizontalEdgesInset: CGFloat = 14
    }
    
    lazy var titleScreen: UILabel = {
        let label = UILabel()
        label.textColor = .yellow
        label.textAlignment = .center
        label.font = UIFont(name: TitleFonts.spartanFont, size: Metrics.titleScreenSize)
        
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
        
        self.addSubview(self.titleScreen)
        self.addSubview(self.collectionView)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardInfoScreenView: ICardInfoScreenView {
    func setTitleScreen(titleScreen: String) {
        self.titleScreen.text = titleScreen
    }
    
    func reloadCollectionViewData() {
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
        titleScreen.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview().inset(Metrics.titleScreenHorizontalEdgesInset)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleScreen.snp.bottom).inset(Metrics.collectionViewTopInset)
            make.horizontalEdges.equalToSuperview().inset(Metrics.collectionViewHorizontalEdgesInset)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
