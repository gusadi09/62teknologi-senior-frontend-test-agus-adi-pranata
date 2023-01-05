//
//  Businesses.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public struct BusinessData: Codable, Hashable {

	public let id: String?
	public let alias: String?
	public let name: String?
	public let imageUrl: String?
	public let isClosed: Bool?
	public let url: String?
	public let reviewCount: Int?
	public let categories: [CategoriesData]?
	public let rating: Double?
	public let coordinates: CoordinatesData?
	public let transactions: [String]?
	public let price: String?
	public let location: LocationData?
	public let phone: String?
	public let displayPhone: String?
	public let distance: Float?

	public enum CodingKeys: String, CodingKey {
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

	public init(
		id: String?,
		alias: String?,
		name: String?,
		imageUrl: String?,
		isClosed: Bool?,
		url: String?,
		reviewCount: Int?,
		categories: [CategoriesData]?,
		rating: Double?,
		coordinates: CoordinatesData?,
		transactions: [String]?,
		price: String?,
		location: LocationData?,
		phone: String?,
		displayPhone: String?,
		distance: Float?
	) {
		self.id = id
		self.alias = alias
		self.name = name
		self.imageUrl = imageUrl
		self.isClosed = isClosed
		self.url = url
		self.reviewCount = reviewCount
		self.categories = categories
		self.rating = rating
		self.coordinates = coordinates
		self.transactions = transactions
		self.price = price
		self.location = location
		self.phone = phone
		self.displayPhone = displayPhone
		self.distance = distance
	}
}

public struct BusinessResponse: Codable {
	public let businesses: [BusinessData]?
	public let total: Int?
	public let region: RegionData?

	public init(businesses: [BusinessData]?, total: Int?, region: RegionData?) {
		self.businesses = businesses
		self.total = total
		self.region = region
	}
}

public struct RegionData: Codable {
	public let center: CoordinatesData?

	public init(center: CoordinatesData?) {
		self.center = center
	}
}

public enum SortType: String {
	case bestMatch = "best_match"
	case rating = "rating"
	case reviewCount = "review_count"
}

public enum FilterType: String {
	case hotAndNew = "hot_and_new"
	case openToAll = "open_to_all"
	case deals = "deals"
}

public struct BusinessesRequestParam: Codable {
	public var location: String = "NYC"
	public var sortBy: String = "best_match"
	public var term: String
	public var price: Int?
	public var openNow: Bool?
	public var attributes: String?
	public var limit: Int

	public init(location: String = "NYC", sortBy: String = SortType.bestMatch.rawValue, term: String, price: Int? = nil, openNow: Bool? = nil, attributes: String? = nil, limit: Int = 10) {
		self.location = location
		self.sortBy = sortBy
		self.term = term
		self.price = price
		self.openNow = openNow
		self.attributes = attributes
		self.limit = limit
	}
}

public extension BusinessData {
	static var sample: BusinessData {
		return BusinessData(
			id: UUID().uuidString,
			alias: "starbucks-tests",
			name: "Starbucks Tests",
			imageUrl: "https://res.cloudinary.com/demo/image/upload/v1312461204/sample.jpg",
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
	}
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
