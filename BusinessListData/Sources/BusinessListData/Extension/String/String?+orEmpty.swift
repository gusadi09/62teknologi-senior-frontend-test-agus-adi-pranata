//
//  FiString?+orEmpty.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public extension Optional where Wrapped == String {
	func orEmpty() -> String {
		self ?? ""
	}
}
