//
//  SearchViewModelTests.swift
//  SearchViewModelTests
//
//  Created by Gus Adi on 06/01/23.
//

import XCTest
@testable import BusinessList

final class SearchViewModelTests: XCTestCase {

	let sut = SearchViewModel()

	func test_toggleFilterAndSortBottomSheet() {
		sut.toogleFilter()

		XCTAssertTrue(sut.isShowFilterSort)
	}

	func test_changeSortType() {
		sut.changeSortType(by: "rating")

		XCTAssertEqual(sut.query.sortBy, "rating")
	}

	func test_changeFilterType() {
		sut.changeFilterType(by: "deals")

		XCTAssertEqual(sut.query.attributes, "deals")
	}
}
