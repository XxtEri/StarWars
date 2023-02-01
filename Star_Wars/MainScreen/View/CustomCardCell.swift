//
//  CollectionViewCell.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import UIKit

class CustomCardCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with model: Card) {
        titleLabel.text = model.title
        
        let image = UIImage(named: model.imageName)
        imageView.image = image
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
    }
}
