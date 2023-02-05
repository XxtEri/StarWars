//
//  MainScreenViewController.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private var ui: IMainScreenView
    private var presenter: MainScreenPresenter
    
    private enum Metrics {
        static let itemsInRow = 2
        
        static let viewInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        static let insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        static let lineSpace: CGFloat = 46
        static let itemSpace: CGFloat = 23
    }
    
    private var listTitleCard: [MainScreenModel] = {
        var array: [MainScreenModel] = []
        
        for title in Category.allCases {
            array.append(MainScreenModel(title: title, imageName: title.rawValue))
        }
        
        return array
    }()
    
    var didSelectCardHandler: ((Category) -> Void)?
    
    init(presenter: MainScreenPresenter) {
        self.ui = MainScreenView(frame: .zero)
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
        
        self.ui.setupCollectionView(delegate: self, dataOutput: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = ui
    }
}

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.listTitleCard.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainScreenCollectionViewCell.reuseIdentifier, for: indexPath) as? MainScreenCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: self.listTitleCard[indexPath.row], numberCard: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath ) -> CGSize {
        
        let sideInsets = (Metrics.insets.left + Metrics.viewInsets.left) * 2
        let insetsSum = Metrics.itemSpace * (CGFloat(Metrics.itemsInRow) - 1) + sideInsets
        let otherSpace = collectionView.frame.width - insetsSum
        let cellWidth = otherSpace / CGFloat(Metrics.itemsInRow)
        
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        Metrics.insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        Metrics.itemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        Metrics.lineSpace
    }
}

extension MainScreenViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        self.didSelectCardHandler?(self.listTitleCard[indexPath.row].title)
    }
}
