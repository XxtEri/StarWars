//
//  ViewControllerMainScreen.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import UIKit

class ViewControllerMainScreen: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
//    lazy var collectionView: UICollectionView = {
//        var view = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewLayout())
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        return view
//    }()
    
    private let namesBlocks = ["Characters", "Films",
                           "Starships", "Vehicles",
                           "Planets", "Species"]
    
    private enum Constants {
            static let itemsInRow = 2
            static let itemsCount = 6
            
            static let viewInsets = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
            static let insets = UIEdgeInsets(top: 101.26, left: 22, bottom: 12, right: 21)
            static let lineSpace: CGFloat = 12
            static let itemSpace: CGFloat = 46
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.addSubview(collectionView)
//        addConstraints()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.collectionView.register(UINib.init(nibName: "CustomCardCell", bundle: nil), forCellWithReuseIdentifier: "CustomCardCell")
    }
    
    func addConstraints() {
            self.collectionView.snp.makeConstraints({ make in
                make.leading.trailing.bottom.top.equalToSuperview()
            })
        }
}

extension ViewControllerMainScreen: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Constants.itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCardCell", for: indexPath) as? CustomCardCell else { return UICollectionViewCell()}
        
        cell.configure(with: Card(title: self.namesBlocks[indexPath.row], imageName: self.namesBlocks[indexPath.row]), numberCard: indexPath.row)
        
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
