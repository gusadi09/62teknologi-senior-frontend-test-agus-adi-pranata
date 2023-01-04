//
//  ErrorResponse.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public struct ErrorResponse: Codable, Error {
	let error: ErrorData?
}

public struct ErrorData: Codable {
	let code: String?
	let description: String?
}
