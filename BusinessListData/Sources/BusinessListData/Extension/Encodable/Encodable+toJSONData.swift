//
//  Encodable+toJSONData.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public extension Encodable {
	func toJSONData() -> Data {
		guard let data =  try? JSONEncoder().encode(self) else {
			return Data()
		}

		return data
	}
}
