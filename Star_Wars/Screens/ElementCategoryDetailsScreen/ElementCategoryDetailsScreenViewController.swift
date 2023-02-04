//
//  ElementCategoryDetailsScreenViewController.swift
//  Star_Wars
//
//  Created by Елена on 04.02.2023.
//

import UIKit

class ElementCategoryDetailsScreenViewController: UIViewController {
    private var ui: ElementCategoryDetailsScreenView
    private var presenter: ElementCategoryDetailsScreenPresenter
    
    let elementUrl: String
    var elementDetails = ElementCategoryDetailsScreenModel(titleElement: "", infoElement: "")
    
    init(presenter: ElementCategoryDetailsScreenPresenter,
         elementUrl: String) {
        self.ui = ElementCategoryDetailsScreenView(frame: .zero)
        self.elementUrl = elementUrl
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.loadElementDetails()
    }
}

extension ElementCategoryDetailsScreenViewController {
    func setData() {
        self.ui.setData(with: self.elementDetails)
    }
    
    func addNewElementDetails(with model: ElementCategoryDetailsScreenModel) {
        self.elementDetails = model
        
        setData()
    }

    func showError(_ error: Error) {
        let alert = UIAlertController(title: "Ошибка",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        
        alert.addAction(.init(title: "Закрыть", style: .cancel))
        
        self.navigationController?.pushViewController(alert, animated: true)
    }
}
