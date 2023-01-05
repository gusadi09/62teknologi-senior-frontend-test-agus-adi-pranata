//
//  BusinessCardViewModel.swift
//  
//
//  Created by Gus Adi on 05/01/23.
//

import BusinessListData
import Foundation

public final class BusinessCardViewModel: ObservableObject {
	@Published var cardData: BusinessData

	public init(cardData: BusinessData) {
		self.cardData = cardData
	}

	public func categoriesText() -> String {
		let mapped = cardData.categories?.compactMap({
			$0.title.orEmpty()
		}) ?? []

		return mapped.joined(separator: ", ")
	}

	public func displayStreetText() -> String {
		(
			cardData.location?.displayAddress ?? []
		).joined(separator: ", ")
	}
}
