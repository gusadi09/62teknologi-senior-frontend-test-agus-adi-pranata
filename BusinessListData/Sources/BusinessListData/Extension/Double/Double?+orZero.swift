//
//  Double?+orZero.swift
//  
//
//  Created by Gus Adi on 05/01/23.
//

import Foundation

public extension Optional where Wrapped == Double {
	func orZero() -> Double {
		self ?? 0.0
	}
}
