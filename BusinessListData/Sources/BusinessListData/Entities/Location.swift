//
//  Location.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public struct LocationData: Codable {
	public let address1: String?
	public let address2: String?
	public let address3: String?
	public let city: String?
	public let zipCode: String?
	public let country: String?
	public let state: String?
	public let displayAddress: [String]?

	public enum CodingKeys: String, CodingKey {
		case address1, address2, address3, city, country, state
		case zipCode = "zip_code"
		case displayAddress = "display_address"
	}

	public init(
		address1: String?,
		address2: String?,
		address3: String?,
		city: String?,
		zipCode: String?,
		country: String?,
		state: String?,
		displayAddress: [String]?
	) {
		self.address1 = address1
		self.address2 = address2
		self.address3 = address3
		self.city = city
		self.zipCode = zipCode
		self.country = country
		self.state = state
		self.displayAddress = displayAddress
	}
}
