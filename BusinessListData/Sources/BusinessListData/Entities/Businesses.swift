//
//  Businesses.swift
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

public struct BusinessesRequestParam: Codable {
	var location: String = "NYC"
	var sortBy: String = "best_match"
	var term: String = ""
	var price: Int? = nil
	var openNow: Bool? = nil
	var attributes: String? = nil
	var limit: Int = 10
}

public extension BusinessResponse {
	static var sampleData: Data {
		return BusinessResponse(
			businesses: [
				BusinessData(
					id: UUID().uuidString,
					alias: "starbucks-tests",
					name: "Starbucks Tests",
					imageUrl: "https://www.google.com/dsjdjasdhsjkd.jpg",
					isClosed: false,
					url: "https://www.google.com/",
					reviewCount: 12,
					categories: [
						CategoriesData(
							alias: "cafe",
							title: "Cafe"
						)
					],
					rating: 4.5,
					coordinates: CoordinatesData(
						latitude: -706.2324343434,
						longitude: 113.2132321313
					),
					transactions: [
						"delivery"
					],
					price: "$$",
					location: LocationData(
						address1: "NYC",
						address2: "",
						address3: "",
						city: "NYC",
						zipCode: "17510",
						country: "US",
						state: "NY",
						displayAddress: ["New York City"]
					),
					phone: "+62121121001",
					displayPhone: "(081) 21121001",
					distance: 23.43434234
				)
			],
			total: 1,
			region: RegionData(
				center: CoordinatesData(
					latitude: -706.2324343434,
					longitude: 113.2132321313
				)
			)
		).toJSONData()
	}
}
