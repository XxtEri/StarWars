//
//  ViewControllerMainScreen.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import UIKit

class ViewControllerMainScreen: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
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

        //collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionViewLayout())
        //collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        //self.view.addSubview(collectionView)
        //addConstraints()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CardCell")
    }
    
    func addConstraints() {
            self.collectionView.snp.makeConstraints({ make in
                make.leading.trailing.bottom.top.equalToSuperview()
            })
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewControllerMainScreen: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Constants.itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath)
        
        guard let new_cell = cell as? CustomCardCell else {
            cell.backgroundColor = .red
            cell.layer.cornerRadius = 50
            
            return cell
        }
        
        new_cell.configure(with: Card(title: self.namesBlocks[indexPath.row], imageName: self.namesBlocks[indexPath.row]))
        
        return new_cell
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
