import UIKit
import SnapKit

class View: UIView {

    let logoImageView: UIImageView
    //let textView: UIView
    //let arrowButtonView: UIView
    
    init() {
        self.logoImageView = UIImageView()
        //self.textView = UIView()
        //self.arrowButtonView = UIView()
        
        super.init(frame: .zero)
        configureView()
    }
    
    func configureView() {
        //stackView
        self.addSubview(self.logoImageView)
        //self.addSubview(self.textLabel)
        //self.addSubview(self.arrowButton)
        
        self.createImageView()
        //self.createLabel()
    }
    
    func createImageView() {
        let logoImageView = UIImageView(frame: self.bounds)
        logoImageView.image = UIImage(named: "logo")
        logoImageView.contentMode = .scaleAspectFit
        
//        self.logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        self.logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        self.logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 148).isActive = true
        //self.logoView.translatesAutoresizingMaskIntoConstraints = false
        
//        self.logoView.snp.makeConstraints { make in
//            make.leading.trailing.equalToSuperview().constraint.isActive = true
//            make.top.equalTo(snp.top).inset(148).constraint.isActive = true
//        }
    }
    
//    func createLabel() {
//        self.textLabel.text = "Explore the Star Wars universe"
//        self.textLabel.font = UIFont.boldSystemFont(ofSize: 24)
//        self.textLabel.textColor = .white
//        self.textLabel.backgroundColor = .orange
//        self.textLabel.textAlignment = .center
//        self.textLabel.numberOfLines = .min
//
//        self.textLabel.snp.makeConstraints { make in
//            make.width.equalTo(UIScreen.main.bounds.width)
//            make.height.equalTo(100)
//            make.leading.equalTo(33)
//            make.trailing.equalTo(32)
//        }
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

