//
//  IconCollectionViewController.swift
//  CollectionView
//
//  Created by Chris Huang on 03/10/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit

class IconCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

	private var iconSet: [Icon] = [ Icon(name: "Candle icon", imageName: "candle", description: "Halloween icons designed by Tania Raskalova.", price: 3.99, isFeatured: false),
	                                Icon(name: "Cat icon", imageName: "cat", description: "Halloween icon designed by Tania Raskalova.", price: 2.99, isFeatured: true),
	                                Icon(name: "dribbble", imageName: "dribbble", description: "Halloween icon designed by Tania Raskalova.", price: 1.99, isFeatured: false),
	                                Icon(name: "Ghost icon", imageName: "ghost", description: "Halloween icon designed by Tania Raskalova.", price: 4.99, isFeatured: false),
	                                Icon(name: "Hat icon", imageName: "hat", description: "Halloween icon designed by Tania Raskalova.", price: 2.99, isFeatured: false),
	                                Icon(name: "Owl icon", imageName: "owl", description: "Halloween icon designed by Tania Raskalova.", price: 5.99, isFeatured: true),
	                                Icon(name: "Pot icon", imageName: "pot", description: "Halloween icon designed by Tania Raskalova.", price: 1.99, isFeatured: false),
	                                Icon(name: "Pumkin icon", imageName: "pumkin", description: "Halloween icon designed by Tania Raskalova.", price: 0.99, isFeatured: false),
	                                Icon(name: "RIP icon", imageName: "rip", description: "Halloween icon designed by Tania Raskalova.", price: 7.99, isFeatured: false),
	                                Icon(name: "Skull icon", imageName: "skull", description: "Halloween icon designed by Tania Raskalova.", price: 8.99, isFeatured: false),
	                                Icon(name: "Sky icon", imageName: "sky", description: "Halloween icon designed by Tania Raskalova.", price: 0.99, isFeatured: false),
	                                Icon(name: "Toxic icon", imageName: "toxic", description: "Halloween icon designed by Tania Raskalova.", price: 2.99, isFeatured: false),
	                                Icon(name: "Book icon", imageName: "ic_book", description: "Colorful icon designed by Marin Begović.", price: 2.99, isFeatured: false),
	                                Icon(name: "Backpack icon", imageName: "ic_backpack", description: "Colorful icon designed by Marin Begović.", price: 3.99, isFeatured: false),
	                                Icon(name: "Camera icon", imageName: "ic_camera", description: "Colorful camera icon designed by Marin Begović.", price: 4.99, isFeatured: false),
	                                Icon(name: "Coffee icon", imageName: "ic_coffee", description: "Colorful icon designed by Marin Begović.", price: 3.99, isFeatured: true),
	                                Icon(name: "Glasses icon", imageName: "ic_glasses", description: "Colorful icon designed by Marin Begović.", price: 3.99, isFeatured: false),
	                                Icon(name: "Icecream icon", imageName: "ic_ice_cream", description: "Colorful icon designed by Marin Begović.", price: 4.99, isFeatured: false),
	                                Icon(name: "Smoking pipe icon", imageName: "ic_smoking_pipe", description: "Colorful icon designed by Marin Begović.", price: 6.99, isFeatured: false),
	                                Icon(name: "Vespa icon", imageName: "ic_vespa", description: "Colorful icon designed by Marin Begović.", price: 9.99, isFeatured: false)]

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
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard shareEnabled else { return }
		let selectedIcon = iconSet[indexPath.item]
		selectedIcons.append(selectedIcon)
	}
	override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
		guard shareEnabled else { return }
		let deselectedIcon = iconSet[indexPath.item]
		if let index = selectedIcons.index(where: { $0.name == deselectedIcon.name })  {
			selectedIcons.remove(at: index)
		}
	}
	
	private var shareEnabled = false
	private var selectedIcons = [Icon]()
	@IBOutlet weak var shareButton: UIBarButtonItem!
	@IBAction func share(_ sender: UIBarButtonItem) {
		if shareEnabled {
			if let indexPaths = collectionView?.indexPathsForSelectedItems {
				indexPaths.forEach { collectionView?.deselectItem(at: $0, animated: true) }
			}
			selectedIcons.removeAll()
			shareEnabled = false
			collectionView?.allowsMultipleSelection = false
			shareButton.title = "Share"
			shareButton.style = .plain
		} else {
			shareEnabled = true
			collectionView?.allowsMultipleSelection = true
			shareButton.title = "Done"
			shareButton.style = .done
		}
	}
	
	// MARK: Navigation
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowDetail" {
			guard let detailViewController = segue.destination as? IconDetailViewController else { return }
			guard let selectedIndexPaths = collectionView?.indexPathsForSelectedItems else { return }
			detailViewController.icon = iconSet[selectedIndexPaths[0].item]
			collectionView?.deselectItem(at: selectedIndexPaths[0], animated: true)
		}
	}
	
	override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
		if identifier == "ShowDetail" {
			if shareEnabled {
				return false
			}
		}
		return true
	}
	
	@IBAction func unwind(segue: UIStoryboardSegue) {
		dismiss(animated: true, completion: nil)
	}
}
