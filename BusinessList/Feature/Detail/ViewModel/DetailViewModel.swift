//
//  DetailViewModel.swift
//  BusinessList
//
//  Created by Gus Adi on 06/01/23.
//

import Foundation

final class DetailViewModel: ObservableObject {

	@Published var alias: String

	init(alias: String) {
		self.alias = alias
	}
}
