//
//  Business.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public struct BusinessData: Codable, Hashable {


	let id: String?
	let alias: String?
	let name: String?
	let imageUrl: String?
	let isClosed: Bool?
	let url: String?
	let reviewCount: Int?
	let categories: [CategoriesData]?
	let rating: Double?
	let coordinates: CoordinatesData?
	let transactions: [String]?
	let price: String?
	let location: LocationData?
	let phone: String?
	let displayPhone: String?
	let distance: Float?

	enum CodingKeys: String, CodingKey {
		case id, alias, name, url, categories, rating, coordinates, transactions, price, location, phone, distance
		case imageUrl = "image_url"
		case isClosed = "is_closed"
		case reviewCount = "review_count"
		case displayPhone = "display_phone"
	}

	public static func == (lhs: BusinessData, rhs: BusinessData) -> Bool {
		lhs.id == rhs.id
	}

	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

public struct BusinessResponse: Codable {
	let businesses: [BusinessData]?
	let total: Int?
	let region: RegionData?
}

public struct RegionData: Codable {
	let center: CoordinatesData?
}
