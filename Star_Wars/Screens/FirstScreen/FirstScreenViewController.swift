//
//  FirstScreenViewController.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

class FirstScreenViewController: UIViewController {

    private var presenter: FirstScreenPresenter
    private var ui: FirstScreenView
    
    var didSelectNextScreenHandler: (() -> Void)?
    
    init(presenter: FirstScreenPresenter) {
        self.ui = FirstScreenView(frame: .zero)
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
        
        self.setHandlers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

private extension FirstScreenViewController {
    func setHandlers() {
        self.ui.nextScreenButtonTapHandler = { [weak self] in
            guard let self = self else { return }
            
            self.didSelectNextScreenHandler?()
            
        }
    }
}
