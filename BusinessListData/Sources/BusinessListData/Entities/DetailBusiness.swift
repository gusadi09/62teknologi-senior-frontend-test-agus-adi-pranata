//
//  DetailBusiness.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public struct DetailBusinessResponse: Codable {
	public let id: String?
	public let alias: String?
	public let name: String?
	public let imageUrl: String?
	public let isClaimed: Bool?
	public let isClosed: Bool?
	public let url: String?
	public let phone: String?
	public let displayPhone: String?
	public let reviewCount: Int?
	public let categories: [CategoriesData]?
	public let rating: Double?
	public let location: LocationData?
	public let coordinates: CoordinatesData?
	public let photos: [String]?
	public let price: String?
	public let hours: [HoursData]?
	public let transactions: [String]?
	public let messaging: MessagingData?

	public enum CodingKeys: String, CodingKey {
		case id, alias, name, url, categories, rating, coordinates, transactions, price, location, phone, photos, messaging, hours
		case imageUrl = "image_url"
		case isClaimed = "is_claimed"
		case isClosed = "is_closed"
		case reviewCount = "review_count"
		case displayPhone = "display_phone"
	}

	public init(
		id: String?,
		alias: String?,
		name: String?,
		imageUrl: String?,
		isClaimed: Bool?,
		isClosed: Bool?,
		url: String?,
		phone: String?,
		displayPhone: String?,
		reviewCount: Int?,
		categories: [CategoriesData]?,
		rating: Double?,
		location: LocationData?,
		coordinates: CoordinatesData?,
		photos: [String]?,
		price: String?,
		hours: [HoursData]?,
		transactions: [String]?,
		messaging: MessagingData?
	) {
		self.id = id
		self.alias = alias
		self.name = name
		self.imageUrl = imageUrl
		self.isClaimed = isClaimed
		self.isClosed = isClosed
		self.url = url
		self.phone = phone
		self.displayPhone = displayPhone
		self.reviewCount = reviewCount
		self.categories = categories
		self.rating = rating
		self.location = location
		self.coordinates = coordinates
		self.photos = photos
		self.price = price
		self.hours = hours
		self.transactions = transactions
		self.messaging = messaging
	}
}

public struct HoursData: Codable {
	public let open: [OpenData]?
	public let hoursType: String?
	public let isOpenNow: Bool?

	public init(open: [OpenData]?, hoursType: String?, isOpenNow: Bool?) {
		self.open = open
		self.hoursType = hoursType
		self.isOpenNow = isOpenNow
	}

	enum CodingKeys: String, CodingKey {
		case open
		case hoursType = "hours_type"
		case isOpenNow = "is_open_now"
	}
}

public struct OpenData: Codable {
	public let isOvernight: Bool?
	public let start: String?
	public let end: String?
	public let day: Int?

	public enum CodingKeys: String, CodingKey {
		case isOvernight = "is_overnight"
		case start, end, day
	}

	public init(isOvernight: Bool?, start: String?, end: String?, day: Int?) {
		self.isOvernight = isOvernight
		self.start = start
		self.end = end
		self.day = day
	}
}

public struct MessagingData: Codable {
	public let url: String?
	public let useCaseText: String?

	public enum CodingKeys: String, CodingKey {
		case url
		case useCaseText = "use_case_text"
	}

	public init(url: String?, useCaseText: String?) {
		self.url = url
		self.useCaseText = useCaseText
	}
}

extension DetailBusinessResponse {
	static var sampleData: Data {
		return DetailBusinessResponse(
			id: UUID().uuidString,
			alias: "starbucks-tests",
			name: "Starbucks Tests",
			imageUrl: "https://www.google.com/dsjdjasdhsjkd.jpg",
			isClaimed: true,
			isClosed: false,
			url: "https://www.google.com/",
			phone: "+62121121001",
			displayPhone: "(081) 21121001",
			reviewCount: 12,
			categories: [
				CategoriesData(alias: "cafe", title: "Cafe")
			],
			rating: 4.5,
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
			coordinates: CoordinatesData(
				latitude: 233.42232323,
				longitude: 12.32323
			),
			photos: [
				"https://www.google.com/dsjdjasdhsjkd.jpg"
			],
			price: "$$$",
			hours: [
				HoursData(
					open: [
						OpenData(
							isOvernight: true,
							start: "0800",
							end: "1100",
							day: 0
						)
					],
					hoursType: "REGULAR",
					isOpenNow: true
				)
			],
			transactions: [],
			messaging: MessagingData(
				url: "https://www.google.com/dsjdjasdhsjkd.jpg",
				useCaseText: "Send Message"
			)
		).toJSONData()
	}
}
