//
//  Location.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public struct LocationData: Codable {
	let address1: String?
	let address2: String?
	let address3: String?
	let city: String?
	let zipCode: String?
	let country: String?
	let state: String?
	let displayAddress: [String]?

	enum CodingKeys: String, CodingKey {
		case address1, address2, address3, city, country, state
		case zipCode = "zip_code"
		case displayAddress = "display_address"
	}
}
