//
//  ViewControllerPlanetScreen.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import UIKit
import SnapKit
import Alamofire

//Model
//id
//label

class ViewControllerCardScreen: UIViewController {
    
    var titleBlock: TitleScreen = .non
    
    private var modelView = ModelViewMainScreen()
    
    private var cardArray: [String] = {
        return ["Ivan", "Lily", "Elena", "Maxim", "Igor", "Masha", "Lily", "Elena", "Maxim", "Igor", "Masha"]
    }()
    
    private var elementsCardArray: Array<Film> = []
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: .zero)
        view.style = .medium
        view.color = .red
        view.hidesWhenStopped = true
        view.isHidden = false
        
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        
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
        label.font = UIFont(name: "Spartan", size: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
        self.view.addSubview(activityIndicator)

        addConstraints()
        
        self.fetch()
        //self.elementsCardArray = modelView.arrayElementsBlock
    }
    
    func addConstraints() {
        titleScreenLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(90)
            make.leading.trailing.equalToSuperview().inset(5)
            make.bottom.equalTo(collectionView.snp.top).inset(-45)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleScreenLabel.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

extension ViewControllerCardScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.elementsCardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomElementCardCell.reuseIdentifier, for: indexPath) as? CustomElementCardCell else { return UICollectionViewCell()}
        
        guard !elementsCardArray.isEmpty else { return UICollectionViewCell()}
        
        cell.configure(with: elementsCardArray[indexPath.row].self)
        
        return cell
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

extension ViewControllerCardScreen {
    
    func fetch() {
        switch self.titleBlock {
        case .films:
            self.fetchFilms()
        case .planets:
            self.fetchFilms()
        default:
            print("Error")
        }
    }
    
    func fetchFilms() {
        let url = "https://swapi.dev/api/" + "films"
        
        self.activityIndicator.startAnimating()
        
        AF.request(url,
                   method: .get,
                   parameters: nil).responseData { [self] response in
            
            self.activityIndicator.stopAnimating()
            
            if let request = response.request {
                print("Request: \(request)")
            }
            
            if let statusCode = response.response?.statusCode {
                print("Status code: \(statusCode)")
                guard statusCode != 400 else {
                    return
                }
                
                guard statusCode != 404 else {
                    return
                }
            }
            
            switch response.result {
            case .success(let data):
                guard let decodeData = try? JSONDecoder().decode(InfoFilms.self, from: data) else { return }
                //self.elementsCardArray as Array<Planet>
                self.elementsCardArray = decodeData.results
                
                self.collectionView.reloadData()
                
            case .failure (let error):
                print(error.localizedDescription)
                return
            }
            
        }
    }
}
