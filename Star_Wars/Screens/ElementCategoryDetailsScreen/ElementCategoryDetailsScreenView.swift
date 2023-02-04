//
//  ElementCategoryDetailsScreenView.swift
//  Star_Wars
//
//  Created by Елена on 04.02.2023.
//

import UIKit
import SnapKit

protocol IElementCategoryDetailsScreenView {
    func setData(with model: ElementCategoryDetailsScreenModel)
}

class ElementCategoryDetailsScreenView: UIView {
    
    private enum Metrics {
        
    }

    lazy var titleElement: UILabel =  {
        let view = UILabel()
        view.textColor = .yellow
        view.textAlignment = .center
        view.font = UIFont(name: view.font.fontName, size: 30)

        return view
    }()

    lazy var infoElement: UITextView = {
        let view = UITextView(frame: .zero)
        view.textColor = .white
        view.textAlignment = .left
        view.backgroundColor = .black
        view.font = .systemFont(ofSize: 18)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleElement)
        self.addSubview(infoElement)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ElementCategoryDetailsScreenView: IElementCategoryDetailsScreenView {
    func setData(with model: ElementCategoryDetailsScreenModel) {
        self.titleElement.text = model.titleElement
        self.infoElement.text = model.infoElement
    }
}

private extension ElementCategoryDetailsScreenView {
    func setup() {
        configure()
        configureConstraints()
    }
    
    func configure() {
        self.backgroundColor = .black
    }
    
    func configureConstraints() {
        titleElement.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(76)
        })
        
        infoElement.snp.makeConstraints({ make in
            make.top.equalTo(self.titleElement.snp.bottom).inset(-35)
            make.leading.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(43)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        })
    }
}
