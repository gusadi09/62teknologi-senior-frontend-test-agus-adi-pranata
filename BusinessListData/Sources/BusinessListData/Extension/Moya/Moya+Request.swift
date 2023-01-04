//
//  Moya+Request.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation
import Moya

public extension MoyaProvider {
	func request<T: Codable>(_ target: Target, model: T.Type) async throws -> T {
		return try await withCheckedThrowingContinuation({ continuation in
			self.request(target) { result in
				switch result {
				case .failure(let error):
					continuation.resume(throwing: error)
				case .success(let response):
					let jsonDecoder = JSONDecoder()
					jsonDecoder.dateDecodingStrategy = .iso8601

					do {
						let decodedData = try jsonDecoder.decode(model.self, from: response.data)

						continuation.resume(returning: decodedData)
					} catch (let error) {
						continuation.resume(throwing: error)
					}
				}
			}
		})
	}
}
