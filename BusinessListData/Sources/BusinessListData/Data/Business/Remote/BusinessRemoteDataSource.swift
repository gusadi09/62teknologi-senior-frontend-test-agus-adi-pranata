//
//  BusinessRemoteDataSource.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation

public protocol BusinessRemoteDataSource {
	func getListOfBusinesses(query: BusinessesRequestParam) async throws -> BusinessResponse
	func getDetailOfBusiness(id: String) async throws -> DetailBusinessResponse
	func getReviewsOfBusiness(alias: String, query: ReviewsQueryParam) async throws -> ReviewsResponse
}
