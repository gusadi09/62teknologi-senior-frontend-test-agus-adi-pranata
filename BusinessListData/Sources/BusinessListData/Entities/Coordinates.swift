//
//  Coordinates.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public struct CoordinatesData: Codable {
	public let latitude: Float?
	public let longitude: Float?

	public init(latitude: Float?, longitude: Float?) {
		self.latitude = latitude
		self.longitude = longitude
	}
}
