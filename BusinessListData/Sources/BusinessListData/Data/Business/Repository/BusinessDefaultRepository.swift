//
//  BusinessDefaultRepository.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public final class BusinessDefaultRepository: BusinessRepository {

	private let remote: BusinessRemoteDataSource

	public init(remote: BusinessRemoteDataSource = BusinessDefaultRemoteDataSource()) {
		self.remote = remote
	}

	public func provideGetListOfBusinesses(with query: BusinessesRequestParam) async throws -> BusinessResponse {
		try await self.remote.getListOfBusinesses(query: query)
	}

	public func provideGetDetailOfBusiness(by id: String) async throws -> DetailBusinessResponse {
		try await self.remote.getDetailOfBusiness(id: id)
	}

	public func provideGetReviewsOfBusiness(by alias: String, with query: ReviewsQueryParam) async throws -> ReviewsResponse {
		try await self.remote.getReviewsOfBusiness(alias: alias, query: query)
	}
}
