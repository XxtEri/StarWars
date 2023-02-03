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
    
    private var listTitleCard: [MainScreenModel] = {
        var array: [MainScreenModel] = []
        
        for title in TitleCard.allCases {
            array.append(MainScreenModel(title: title, imageName: title.rawValue))
        }
        
        return array
    }()
    
    var didSelectCardHandler: ((TitleCard) -> Void)?
    
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

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
}

extension MainScreenViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        self.didSelectCardHandler?(self.listTitleCard[indexPath.row].title)
    }
}
