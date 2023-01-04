//
//  BusinessRepositoryTests.swift
//  
//
//  Created by Gus Adi on 05/01/23.
//

import XCTest
import Moya
@testable import BusinessListData

final class BusinessRepositoryTests: XCTestCase {
	let repository = BusinessDefaultRepository()

	func test_getListOfBusiness() async throws {
		let expectation = self.expectation(description: "ListOfBusinessesReal")

		let result = try await repository.provideGetListOfBusinesses(with: BusinessesRequestParam())

		expectation.fulfill()

		await waitForExpectations(timeout: 5)

		XCTAssertNotNil(result.businesses)
	}

	func test_getDetailOfBusiness() async throws {
		let expectation = self.expectation(description: "DetailOfBusinessesReal")

		let result = try await repository.provideGetListOfBusinesses(with: BusinessesRequestParam())
		let detail = try await repository.provideGetDetailOfBusiness(by: (result.businesses?.first?.id).orEmpty())

		expectation.fulfill()

		await waitForExpectations(timeout: 5)

		XCTAssertNotNil(detail.name)
	}
}
