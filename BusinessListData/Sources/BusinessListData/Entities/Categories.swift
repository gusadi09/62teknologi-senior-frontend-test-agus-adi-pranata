//
//  Categories.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public struct CategoriesData: Codable {
	public let alias: String?
	public let title: String?

	public init(alias: String?, title: String?) {
		self.alias = alias
		self.title = title
	}
}
