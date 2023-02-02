//
//  ViewControllerMainScreen.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import UIKit
import SnapKit

class ViewControllerMainScreen: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        var view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.delegate = self
        view.dataSource = self
        
        view.register(CustomCardCell.self, forCellWithReuseIdentifier: CustomCardCell.reuseIdentifier)

        return view
    }()
    
    private var listTitleCard: [String] = {
        var array: [String] = []
        
        for title in TitleScreen.allCases {
            array.append(title.rawValue)
        }
        
        return array
    }()
    
    private enum Constants {
        static let itemsInRow = 2
        static let itemsCount = 6
        
        static let viewInsets = UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 11)
        static let insets = UIEdgeInsets(top: UIScreen.main.bounds.size.height / 12, left: 11, bottom: 0, right: 10)
        static let lineSpace: CGFloat = 23
        static let itemSpace: CGFloat = 46
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.view.addSubview(collectionView)
        self.view.inputViewController?.navigationItem.hidesBackButton = true
        collectionView.backgroundColor = .black
        addConstraints()
    }
    
    
    func addConstraints() {
        self.collectionView.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        })
    }
}

extension ViewControllerMainScreen: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Constants.itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCardCell.reuseIdentifier, for: indexPath) as? CustomCardCell else { return UICollectionViewCell()}
        
        cell.configure(with: Card(title: listTitleCard[indexPath.row], imageName: listTitleCard[indexPath.row]), numberCard: indexPath.row, self.navigationController)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath ) -> CGSize {
        
        let sideInsets = (Constants.insets.left + Constants.viewInsets.left) * 2
        let insetsSum = Constants.itemSpace * (CGFloat(Constants.itemsInRow) - 1) + sideInsets
        let otherSpace = collectionView.frame.width - insetsSum
        let cellWidth = otherSpace / CGFloat(Constants.itemsInRow)
        
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        Constants.insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        Constants.lineSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        Constants.itemSpace
    }
}
