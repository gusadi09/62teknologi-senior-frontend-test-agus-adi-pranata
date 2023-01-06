//
//  BusinessDefaultRemoteDataSource.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation
import Moya

public final class BusinessDefaultRemoteDataSource: BusinessRemoteDataSource {

	private let provider: MoyaProvider<BusinessTargetType>

	public init(provider: MoyaProvider<BusinessTargetType> = .defaultProvider()) {
		self.provider = provider
	}

	public func getListOfBusinesses(query: BusinessesRequestParam) async throws -> BusinessResponse {
		try await self.provider.request(.getListOfBusinesses(query), model: BusinessResponse.self)
	}

	public func getDetailOfBusiness(id: String) async throws -> DetailBusinessResponse {
		try await self.provider.request(.getDetailOfBusiness(id), model: DetailBusinessResponse.self)
	}

	public func getReviewsOfBusiness(alias: String) async throws -> ReviewsResponse {
		try await self.provider.request(.getReviewsOfBusiness(alias), model: ReviewsResponse.self)
	}
}
