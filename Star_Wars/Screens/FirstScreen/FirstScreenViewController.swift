//
//  FirstScreenViewController.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

class FirstScreenViewController: UIViewController {

    private var ui: FirstScreenView
    
    var didSelectNextScreenHandler: (() -> Void)?
    
    init() {
        self.ui = FirstScreenView(frame: .zero)
        
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

    }

}

private extension FirstScreenViewController {
    func setHandlers() {
        let view = ViewControllerMainScreen()
        view.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationController?.pushViewController(view, animated: true)
    }
}
