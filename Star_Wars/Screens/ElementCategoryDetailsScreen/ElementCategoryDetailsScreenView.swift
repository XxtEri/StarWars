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
        static let titleElementSize: CGFloat = 30
        static let titleElementHorizontalEdgesInent: CGFloat = 10
        static let infoElementSize: CGFloat = 18
        static let infoElementTopInset: CGFloat = -35
        static let infoElementLeadingInset: CGFloat = 30
        static let infoElementTrailingInset: CGFloat = 43
    }

    lazy var titleElement: UILabel =  {
        let view = UILabel()
        view.textColor = .yellow
        view.textAlignment = .center
        view.font = UIFont(name: TitleFonts.SpartanFont, size: Metrics.titleElementSize)

        return view
    }()

    lazy var infoElement: UITextView = {
        let view = UITextView(frame: .zero)
        view.textColor = .white
        view.textAlignment = .left
        view.backgroundColor = .black
        view.font = UIFont(name: TitleFonts.SpartanFont, size: Metrics.infoElementSize)
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
            make.horizontalEdges.equalToSuperview().inset(Metrics.titleElementHorizontalEdgesInent)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
        })
        
        infoElement.snp.makeConstraints({ make in
            make.top.equalTo(self.titleElement.snp.bottom).inset(Metrics.infoElementTopInset)
            make.leading.equalToSuperview().inset(Metrics.infoElementLeadingInset)
            make.trailing.equalToSuperview().inset(Metrics.infoElementTrailingInset)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        })
    }
}
