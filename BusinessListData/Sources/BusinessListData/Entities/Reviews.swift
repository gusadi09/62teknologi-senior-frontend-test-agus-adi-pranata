//
//  Reviews.swift
//  
//
//  Created by Gus Adi on 07/01/23.
//

import Foundation

public struct ReviewsResponse: Codable {
	public let reviews: [ReviewData]?
	public let total: Int?
	public let possibleLanguages: [String]?

	public init(reviews: [ReviewData]?, total: Int?, possibleLanguages: [String]?) {
		self.reviews = reviews
		self.total = total
		self.possibleLanguages = possibleLanguages
	}

	public enum CodingKeys: String, CodingKey {
		case reviews, total
		case possibleLanguages = "possible_languages"
	}
}

public struct ReviewData: Codable {
	public let id: String?
	public let url: String?
	public let text: String?
	public let rating: Int?
	public let timeCreated: String?
	public let user: UserData?

	public enum CodingKeys: String, CodingKey {
		case id, url, text, rating, user
		case timeCreated = "time_created"
	}

	public init(id: String?, url: String?, text: String?, rating: Int?, timeCreated: String?, user: UserData?) {
		self.id = id
		self.url = url
		self.text = text
		self.rating = rating
		self.timeCreated = timeCreated
		self.user = user
	}
}

public extension ReviewData {
	static var sample: ReviewData {
		ReviewData(
			id: UUID().uuidString,
			url: "https://www.github.com",
			text: "Nice Web",
			rating: 3,
			timeCreated: "2022-10-12 10:35:10",
			user: UserData(
				id: UUID().uuidString,
				profileUrl: "https://www.google.com",
				imageUrl: "https://s3-media4.fl.yelpcdn.com/photo/tLjk79Gz6kE7CJMkzTkRnA/o.jpg",
				name: "Kevin"
			)
		)
	}
}

public extension ReviewsResponse {
	static var sampleData: Data {
		ReviewsResponse(
			reviews: [ReviewData.sample],
			total: 1,
			possibleLanguages: [
				"id"
			]
		).toJSONData()
	}
}

public struct UserData: Codable {
	public let id: String?
	public let profileUrl: String?
	public let imageUrl: String?
	public let name: String?

	public enum CodingKeys: String, CodingKey {
		case id, name
		case profileUrl = "profile_url"
		case imageUrl = "image_url"
	}

	public init(id: String?, profileUrl: String?, imageUrl: String?, name: String?) {
		self.id = id
		self.profileUrl = profileUrl
		self.imageUrl = imageUrl
		self.name = name
	}
}
