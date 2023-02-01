//
//  ViewControllerPlanetScreen.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import UIKit
import SnapKit

class ViewControllerPlanetScreen: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var titleScreen: UILabel = {
        let label = UILabel()
        label.text = "PLANETS"
        label.textColor = .yellow
        label.textAlignment = .center
        label.font = UIFont(name: label.font.fontName, size: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private enum Constants {
        static let itemsInRow = 1
        static let itemsCount = 6
        
        static let lineSpace: CGFloat = 12
        static let itemSpace: CGFloat = 12
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.view.addSubview(titleScreen)
        //collectionView.backgroundColor = .black
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib.init(nibName: "CustomPlanetCell", bundle: nil), forCellWithReuseIdentifier: "CustomPlanetCell")
        
        addConstraints()
    }
    
    func addConstraints() {
        titleScreen.snp.makeConstraints({ make in
            make.top.equalToSuperview().inset(76.26)
            make.leading.trailing.equalToSuperview().inset(5)
            make.bottom.equalTo(collectionView.snp.top).inset(-45)
        })
        
        collectionView.snp.makeConstraints({ make in
            make.top.equalTo(titleScreen.snp.bottom)
            make.bottom.trailing.leading.equalToSuperview().inset(14)
        })
    }
}

extension ViewControllerPlanetScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Constants.itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomPlanetCell", for: indexPath) as? CustomPlanetCell else { return UICollectionViewCell()}
        
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomPlanetCell", for: indexPath)
        
        cell.configure(with: Planet(title: "Characters", imageName: "Characters"))
        //cell.backgroundColor = UIColor.red
        cell.layer.cornerRadius = 50
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath ) -> CGSize {
        
        //let sideInsets = (Constants.insets.left + Constants.viewInsets.left) * 2
        let insetsSum = Constants.itemSpace * (CGFloat(Constants.itemsInRow) - 1)
        //+ sideInsets
        let otherSpace = collectionView.frame.width - insetsSum
        let cellWidth = otherSpace / CGFloat(Constants.itemsInRow)
        
        return CGSize(width: cellWidth, height: 65)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        Constants.insets
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        Constants.itemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        Constants.lineSpace
    }
    
    
}
