//
//  FirstScreenView.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

class FirstScreenView: UIView {
    private enum Metrics {
        static let sizeText: CGFloat = 24
        static let imageLogoTopInset: CGFloat = 148
        static let imageLogoBottonInset: CGFloat = 399
        static let textLableHorizontalEdgesInset: CGFloat = 32
        static let textLableTopInset: CGFloat = -198
        static let nextButtonImageViewSize: CGFloat = 150
        static let nextButtonImageViewBottomInset: CGFloat = 63
    }
    
    private lazy var stack: UIStackView = {
        let view = UIStackView(frame: .zero)
        
        return view
    }()
    
    private lazy var imageLogo: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Logo")
        
        return view
    }()
    
    private lazy var textLabel: UILabel = {
        let view = UILabel()
        view.text = "Explore the Star Wars universe"
        view.font = UIFont(name: "Lexend-Bold", size: Metrics.sizeText)
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = .min
        
        return view
    }()
    
    private lazy var nextButtonImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "Allow")
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    var nextScreenButtonTapHandler: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.stack.addSubview(imageLogo)
        self.stack.addSubview(textLabel)
        
        self.addSubview(stack)
        self.addSubview(nextButtonImageView)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension FirstScreenView {
    func setup() {
        configureUI()
        configureConstraints()
        configureActions()
    }
    
    func configureUI() {
        self.backgroundColor = .black
    }
    
    func configureConstraints() {
        stack.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        imageLogo.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalToSuperview().inset(Metrics.imageLogoTopInset)
            make.bottom.equalToSuperview().inset(Metrics.imageLogoBottonInset)
        }
        
        textLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(Metrics.textLableHorizontalEdgesInset)
            make.top.equalTo(imageLogo.snp_bottomMargin).inset(Metrics.textLableTopInset)
        }
        
        nextButtonImageView.snp.makeConstraints {make in
            make.width.height.equalTo(Metrics.nextButtonImageViewSize)
            make.trailing.equalToSuperview()
            make.bottom.greaterThanOrEqualToSuperview().inset(Metrics.nextButtonImageViewBottomInset)
            make.top.equalTo(self.textLabel.snp_bottomMargin)
        }
    }
    
    func configureActions() {
        self.nextButtonImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(performDisplaySecondVC(paramSender:))))
    }
    
    @objc
    func performDisplaySecondVC(paramSender: UIImageView) {
        self.nextScreenButtonTapHandler?()
    }
}
