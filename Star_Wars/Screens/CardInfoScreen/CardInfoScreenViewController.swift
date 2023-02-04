//
//  CardInfoScreenViewController.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

protocol ICardInfoScreenViewController {
    var didSelectElementCategory: ((String) -> Void)? {get set}
    
    func setTitle(title: String)
    func setElementsCardArray(with models: [CardInfoScreenModel])
    func showError(_ error: Error)
}

class CardInfoScreenViewController: UIViewController {

    private enum Metrics {
        static let itemsInRow = 1
        static let cellHeight: CGFloat = 65
        static let viewInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        static let insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        static let lineSpace: CGFloat = 46
        static let itemSpace: CGFloat = 23
    }
    
    private var presenter: CardInfoScreenPresenter
    private var ui: ICardInfoScreenView
    private var elementsCardArray = [CardInfoScreenModel]()
    
    var didSelectElementCategory: ((String) -> Void)?
    
    init(presenter: CardInfoScreenPresenter) {
        self.presenter = presenter
        self.ui = CardInfoScreenView()
        
        super.init(nibName: nil, bundle: nil)
        
        self.ui.setupCollectionView(delegate: self, dataOutput: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.loadElementsCard()
    }
    
}

extension CardInfoScreenViewController: ICardInfoScreenViewController {
    func setTitle(title: String) {
        self.ui.setTitleScreen(titleScreen: title)
    }
    
    func setElementsCardArray(with models: [CardInfoScreenModel]) {
        self.elementsCardArray.append(contentsOf: models)

        DispatchQueue.main.async { [weak self] in
            self?.ui.reloadCollectionView()
        }
    }
    
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "Ошибка",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)


        alert.addAction(.init(title: "Закрыть", style: .cancel))

        self.navigationController?.pushViewController(alert, animated: true)
    }
}

extension CardInfoScreenViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.elementsCardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardInfoScreenCollectionViewCell.reuseIdentifier, for: indexPath) as? CardInfoScreenCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: self.elementsCardArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath ) -> CGSize {
        
        let sideInsets = (Metrics.insets.left + Metrics.viewInsets.left) * 2
        let insetsSum = Metrics.itemSpace * (CGFloat(Metrics.itemsInRow) - 1) + sideInsets
        let otherSpace = collectionView.frame.width - insetsSum
        let cellWidth = otherSpace / CGFloat(Metrics.itemsInRow)
        
        return CGSize(width: cellWidth, height: Metrics.cellHeight)
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

extension CardInfoScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        self.didSelectElementCategory?(self.elementsCardArray[indexPath.row].elementUrl)
    }
    
    //для пагинации
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height + Metrics.cellHeight) > scrollView.contentSize.height) {
               //eqweqw
        }
    }
}
