//
//  IconCollectionViewController.swift
//  CollectionView
//
//  Created by Chris Huang on 03/10/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit

class IconCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

	private var iconSet: [Icon] = [ Icon(name: "candle", price: 3.99, isFeatured: false),
	                                Icon(name: "cat", price: 2.99, isFeatured: true),
	                                Icon(name: "dribbble", price: 1.99, isFeatured: false),
	                                Icon(name: "ghost", price: 4.99, isFeatured: false),
	                                Icon(name: "hat", price: 2.99, isFeatured: false),
	                                Icon(name: "owl", price: 5.99, isFeatured: true),
	                                Icon(name: "pot", price: 1.99, isFeatured: false),
	                                Icon(name: "pumkin", price: 0.99, isFeatured: false),
	                                Icon(name: "rip", price: 7.99, isFeatured: false),
	                                Icon(name: "skull", price: 8.99, isFeatured: false),
	                                Icon(name: "sky", price: 0.99, isFeatured: false),
	                                Icon(name: "toxic", price: 2.99, isFeatured: false),
	                                Icon(name: "ic_book", price: 2.99, isFeatured: false),
	                                Icon(name: "ic_backpack", price: 3.99, isFeatured: false),
	                                Icon(name: "ic_camera", price: 4.99, isFeatured: false),
	                                Icon(name: "ic_coffee", price: 3.99, isFeatured: true),
	                                Icon(name: "ic_glasses", price: 3.99, isFeatured: false),
	                                Icon(name: "ic_ice_cream", price: 4.99, isFeatured: false),
	                                Icon(name: "ic_smoking_pipe", price: 6.99, isFeatured: false),
	                                Icon(name: "ic_vespa", price: 9.99, isFeatured: false)]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always
		
		if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
			flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
		}
	}
	
	// MARK: UICollectionViewDataSource and UICollectionViewDelegate
	
	override func numberOfSections(in collectionView: UICollectionView) -> Int { return 1  }
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return iconSet.count
	}
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCell", for: indexPath) as! IconCell
		cell.icon = iconSet[indexPath.item]
		return cell
	}
}
