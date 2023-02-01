//
//  ViewController.swift
//  Star_Wars
//
//  Created by Елена on 29.01.2023.
//

import UIKit
import SnapKit

//FirstScreen
class ViewControllerFirstScreen: UIViewController {
    
    var stack: UIStackView = {
        let view = UIStackView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    var textLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    var buttonView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        createImageView()
        createTextLabel()
        createButtonView()
        
        stack.addSubview(imageView)
        stack.addSubview(textLabel)
        
        view.addSubview(stack)
        view.addSubview(buttonView)
        
        addConstraintsStack()
        addConstraintsImageView()
        addConstraintsTextLabel()
        addConstraintsButtonView()
    }
    
    //MARK: -Method
    func createImageView() {
        //узнать, как сделать, так, чтобы высота сама подбиралась
        self.imageView = UIImageView()
        self.imageView.image = UIImage(named: "Logo")
    }
    
    func createTextLabel() {
        textLabel.text = "Explore the Star Wars universe"
        textLabel.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        textLabel.numberOfLines = .min
    }
    
    func createButtonView() {
        self.buttonView = UIImageView()
        self.buttonView.image = UIImage(named: "Allow")
        self.buttonView.isUserInteractionEnabled = true
        self.buttonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(performDisplaySecondVC(paramSender:))))
    }
    
    func addConstraintsStack() {
        stack.snp.makeConstraints({ make in
            make.leading.trailing.top.bottom.equalToSuperview().constraint.isActive = true
        })
    }
    
    func addConstraintsImageView() {
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(148)
            make.bottom.equalToSuperview().inset(399)
        }
    }
    
    func addConstraintsTextLabel() {
        textLabel.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(32)
            make.top.equalTo(imageView.snp_bottomMargin).inset(-198)
        }
    }
    
    func addConstraintsButtonView() {
        buttonView.snp.makeConstraints({make in
            make.width.equalTo(150)
            make.height.equalTo(150)
            make.trailing.equalToSuperview()
            make.bottom.greaterThanOrEqualToSuperview().inset(63)
            make.top.equalTo(self.textLabel.snp_bottomMargin)
        })
    }
    
    @objc func performDisplaySecondVC(paramSender: UIImageView) {
        print("Press")
        self.navigationController?.pushViewController(ViewControllerMainScreen(), animated: true)
    }
}
