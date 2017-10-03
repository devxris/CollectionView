//
//  IconDetailViewController.swift
//  CollectionView
//
//  Created by Chris Huang on 03/10/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit

class IconDetailViewController: UIViewController {
	
	var icon: Icon?

	@IBOutlet weak var nameLabel: UILabel! { didSet { nameLabel.text = icon?.name } }
	@IBOutlet weak var descriptionLabel: UILabel! { didSet { descriptionLabel.text = icon?.description } }
	@IBOutlet weak var priceLabel: UILabel! { didSet { priceLabel.text = "$\(icon?.price ?? 0)" } }
	@IBOutlet weak var iconImageView: UIImageView! {
		didSet {
			iconImageView.image = UIImage(named: icon?.imageName ?? "")
		}
	}
	
	@IBAction func buy(_ sender: UIButton) {
	}
}
