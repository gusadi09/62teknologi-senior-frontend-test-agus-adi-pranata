//
//  Encodable+toJSON.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public extension Encodable {
	func toJSON() -> [String: Any] {
		guard let data =  try? JSONEncoder().encode(self),
			  let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed),
			  let json = dictionary as? [String: Any] else {
			return [:]
		}

		return json
	}
}
