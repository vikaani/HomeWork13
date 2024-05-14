//
//  CatalogCell.swift
//  Lesson13HW
//
//  Created by Vika on 10.04.2024.
//

import UIKit

class CatalogCell: UITableViewCell {
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet private var favoriteButton: UIButton!
    @IBOutlet private var starsStackView: StarStackView!
    
    var onTap: ((CatalogCell) -> Void)?

    @IBAction func didTapFavoriteButton() {
        onTap?(self)
    }
    
    func setStars(count: Int) {
        starsStackView.setStars(count: count)
    }
    
    func updateFavorite(isFavorited: Bool) {
        let image = UIImage(systemName: isFavorited ? "heart.fill" : "heart")
        favoriteButton.setImage(image, for: .normal)
    }
}

class StarStackView: UIStackView {
    private let maxStarsCount = 5
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setStars(count: Int) {
        resetStars()
        
        for i in 0..<count {
            starImageViews[i].image =  UIImage(systemName: "star.fill")
        }
    }
    
    func resetStars() {
        starImageViews.forEach { imageView in
            imageView.image = UIImage(systemName: "star")
        }
    }
    
    private var starImageViews: [UIImageView] {
        subviews as! [UIImageView]
    }
    
    private func setup() {
        for _ in 0..<maxStarsCount {
            let image = UIImage(systemName: "star.fill")
            let imageView = UIImageView(image: image)
            imageView.tintColor = .systemYellow
            addArrangedSubview(imageView)
        }

        distribution = .fillEqually
        spacing = 2
    }
}
