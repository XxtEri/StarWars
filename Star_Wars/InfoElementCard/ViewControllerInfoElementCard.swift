import UIKit

class ViewControllerInfoElementCard: UIViewController {
    
    lazy var titleElementCard: UILabel =  {
        let view = UILabel()
        view.textColor = .yellow
        view.textAlignment = .center
        view.text = "Mustafar"
        view.font = UIFont(name: view.font.fontName, size: 30)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var imageElementCard: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "Mustafar")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var infoElementCard: UITextView = {
        let view = UITextView(frame: .zero)
        view.textColor = .red
        view.textAlignment = .left
        view.backgroundColor = .black
        view.font = .systemFont(ofSize: 18)
        view.text = "Population: 20,000\n\nRotation Period: 36 days\n\nOrbital Period: 412 days\n\nDiameter: 4,200km\n\nGravity: 1 Standard\n\nTerrain: Volcanoes, Lava\n\nRivers, Mountains, Caves\n\nSurface Water: 0%\n\nClimate: Hot"
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .black
        self.view.addSubview(titleElementCard)
        self.view.addSubview(imageElementCard)
        self.view.addSubview(infoElementCard)
        
        setConstraints()
    }
    
    func setConstraints() {
        titleElementCard.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(76)
        })
        
        imageElementCard.snp.makeConstraints({ make in
            make.leading.equalToSuperview().inset(70)
            make.trailing.equalToSuperview().inset(49)
            make.top.equalTo(self.titleElementCard.snp.bottom).inset(-30)
            make.centerX.equalToSuperview()
        })
        
        infoElementCard.snp.makeConstraints({ make in
            make.top.equalTo(imageElementCard.snp.bottom).inset(-43)
            make.leading.equalToSuperview().inset(58)
            make.trailing.equalToSuperview().inset(43)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        })
    }
}
