//
//  DoodleCell.swift
//  CollectionView
//
//  Created by Chris Huang on 03/10/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit

class IconCell: UICollectionViewCell {
	
	@IBOutlet weak var iconImageView: UIImageView!
	@IBOutlet weak var priceLabel: UILabel!
	
	var icon: Icon? {
		didSet {
			guard let icon = icon else { return }
			iconImageView.image = UIImage(named: icon.imageName)
			priceLabel.text = "$\(icon.price)"
			backgroundView = icon.isFeatured ? UIImageView(image: #imageLiteral(resourceName: "feature-bg")) : nil
		}
	}
}
