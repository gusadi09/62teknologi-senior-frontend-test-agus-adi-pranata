//
//  DetailBusiness.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public struct DetailBusinessResponse: Codable {
	let id: String?
	let alias: String?
	let name: String?
	let imageUrl: String?
	let isClaimed: Bool?
	let isClosed: Bool?
	let url: String?
	let phone: String?
	let displayPhone: String?
	let reviewCount: Int?
	let categories: [CategoriesData]?
	let rating: Double?
	let location: LocationData?
	let coordinates: CoordinatesData?
	let photos: [String]?
	let price: String?
	let hours: [HoursData]?
	let transactions: [String]?
	let messaging: MessagingData?

	enum CodingKeys: String, CodingKey {
		case id, alias, name, url, categories, rating, coordinates, transactions, price, location, phone, photos, messaging, hours
		case imageUrl = "image_url"
		case isClaimed = "is_claimed"
		case isClosed = "is_closed"
		case reviewCount = "review_count"
		case displayPhone = "display_phone"
	}
}

public struct HoursData: Codable {
	let open: [OpenData]?
	let hoursType: String?
	let isOpenNow: Bool?

	enum CodingKeys: String, CodingKey {
		case open
		case hoursType = "hours_type"
		case isOpenNow = "is_open_now"
	}
}

public struct OpenData: Codable {
	let isOvernight: Bool?
	let start: String?
	let end: String?
	let day: Int?

	enum CodingKeys: String, CodingKey {
		case isOvernight = "is_overnight"
		case start, end, day
	}
}

public struct MessagingData: Codable {
	let url: String?
	let useCaseText: String?

	enum CodingKeys: String, CodingKey {
		case url
		case useCaseText = "use_case_text"
	}
}
