//
//  MainScreenView.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit
import SnapKit

protocol IMainScreenView: UIView {
    func reloadCollectionViewData()
    func setupCollectionView(delegate: UICollectionViewDelegate, dataOutput: UICollectionViewDataSource)
}

final class MainScreenView: UIView {
    private enum Metrics {
        static let collectionViewLeadingInset: CGFloat = 22
        static let collectionViewTrailingInset: CGFloat = 21
    }
    
    lazy var collectionView: UICollectionView = {
        var view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .black
        view.isScrollEnabled = true
        view.register(MainScreenCollectionViewCell
            .self, forCellWithReuseIdentifier: MainScreenCollectionViewCell.reuseIdentifier)

        return view
    }()
    
    private var collectionViewDelegate: UICollectionViewDelegate?
    private var collectionViewDataOutput: UICollectionViewDataSource?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.collectionView)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainScreenView: IMainScreenView {
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

private extension MainScreenView {
    func setup() {
        self.configure()
        self.configureConstraints()
    }
    
    func configure() {
        self.backgroundColor = .black
    }
    
    func configureConstraints() {
        self.collectionView.snp.makeConstraints({ make in
            make.leading.equalToSuperview().inset(Metrics.collectionViewLeadingInset)
            make.trailing.equalToSuperview().inset(Metrics.collectionViewTrailingInset)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        })
    }
}
