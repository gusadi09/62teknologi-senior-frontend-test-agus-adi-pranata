//
//  ErrorResponse.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public struct ErrorResponse: Codable, Error {
	public let error: ErrorData?

	public init(error: ErrorData?) {
		self.error = error
	}
}

public struct ErrorData: Codable {
	public let code: String?
	public let description: String?

	public init(code: String?, description: String?) {
		self.code = code
		self.description = description
	}
}
