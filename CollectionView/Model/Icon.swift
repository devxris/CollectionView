//
//  Icon.swift
//  CollectionView
//
//  Created by Chris Huang on 03/10/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import Foundation

struct Icon {
	
	var name: String = ""
	var price: Double = 0
	var isFeatured: Bool = false
	var imageName: String = ""
	var description: String = ""
	
	init(name: String, imageName: String, description: String, price: Double, isFeatured: Bool) {
		self.name = name
		self.price = price
		self.isFeatured = isFeatured
		self.imageName = imageName
		self.description = description
	}
}
