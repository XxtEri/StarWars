//
//  ViewControllerPlanetScreen.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import UIKit
import SnapKit

class ViewControllerCardScreen: UIViewController {
    
    var titleBlock: TitleScreen = .non
    
    var cardArray: [String] = {
        return ["Ivan", "Lily", "Elena", "Maxim", "Igor", "Masha", "Lily", "Elena", "Maxim", "Igor", "Masha"]
    }()
    
    var elementsCardArray: Array<AnyObject> = []
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.delegate = self
        view.dataSource = self
        
        view.register(CustomElementCardCell.self, forCellWithReuseIdentifier: CustomElementCardCell.reuseIdentifier)
        
        return view
    }()
    
    lazy var titleScreenLabel: UILabel = {
        let label = UILabel()
        label.text = titleBlock.rawValue.uppercased()
        label.textColor = .yellow
        label.textAlignment = .center
        label.font = UIFont(name: label.font.fontName, size: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private enum Constants {
        static let itemsInRow = 1
        static let itemsCount = 6
        
        static let viewInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)
        static let insets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)
        
        static let lineSpace: CGFloat = 21
        static let itemSpace: CGFloat = 21
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.view.addSubview(titleScreenLabel)
        self.view.addSubview(collectionView)
        
        collectionView.backgroundColor = .black

        addConstraints()
    }
    
    func addConstraints() {
        titleScreenLabel.snp.makeConstraints({ make in
            make.top.equalToSuperview().inset(90)
            make.leading.trailing.equalToSuperview().inset(5)
            make.bottom.equalTo(collectionView.snp.top).inset(-45)
        })
        
        collectionView.snp.makeConstraints({ make in
            make.top.equalTo(titleScreenLabel.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        })
    }
}

extension ViewControllerCardScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.elementsCardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomElementCardCell.reuseIdentifier, for: indexPath) as? CustomElementCardCell else { return UICollectionViewCell()}
        
        if !elementsCardArray.isEmpty {
            print(elementsCardArray)
            cell.configure(with: elementsCardArray[indexPath.row].self, self.titleBlock)
            
            return cell
        }
        
        //cell.configure(with: cardArray[indexPath.row], self.titleBlock)
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath ) -> CGSize {
        
        let sideInsets = (Constants.insets.left + Constants.viewInsets.left) * 2
        let insetsSum = Constants.itemSpace * (CGFloat(Constants.itemsInRow) - 1) + sideInsets
        let otherSpace = collectionView.frame.width - insetsSum
        let cellWidth = otherSpace / CGFloat(Constants.itemsInRow)
        
        return CGSize(width: cellWidth, height: 65)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        Constants.insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        Constants.itemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        Constants.lineSpace
    }
    
    
}