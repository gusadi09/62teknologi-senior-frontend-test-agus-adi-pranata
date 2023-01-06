//
//  Int?+orZero.swift
//  
//
//  Created by Gus Adi on 07/01/23.
//

import Foundation

public extension Optional where Wrapped == Int {
	func orZero() -> Int {
		self ?? 0
	}
}
