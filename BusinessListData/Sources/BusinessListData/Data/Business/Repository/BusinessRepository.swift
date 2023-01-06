//
//  BusinessRepository.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public protocol BusinessRepository {
	func provideGetListOfBusinesses(with query: BusinessesRequestParam) async throws -> BusinessResponse
	func provideGetDetailOfBusiness(by id: String) async throws -> DetailBusinessResponse
	func provideGetReviewsOfBusiness(by alias: String, with query: ReviewsQueryParam) async throws -> ReviewsResponse
}
