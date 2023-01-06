//
//  DetailViewModel.swift
//  BusinessList
//
//  Created by Gus Adi on 06/01/23.
//

import Foundation

final class DetailViewModel: ObservableObject {

	@Published var id: String

	init(id: String) {
		self.id = id
	}
}
