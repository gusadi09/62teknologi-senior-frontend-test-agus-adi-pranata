import XCTest
import Moya
@testable import BusinessListData

final class BusinessTests: XCTestCase {

	let helper = BusinessStubHelper()

    func test_success_getListOfBusinesses() async throws {
		let expectation = self.expectation(description: "ListOfBusinesses")

		await helper.stubGetListOfBusiness()

		expectation.fulfill()

		await waitForExpectations(timeout: 5)

		XCTAssertEqual(helper.listResult.count, 1)
    }

	func test_errorUnauthorized_getListOfBusinesses() async throws {
		let expectation = self.expectation(description: "ErrorListOfBusinesses")

		await helper.stubErrorOfListBusinessRequest()

		expectation.fulfill()

		await waitForExpectations(timeout: 5)

		XCTAssertEqual(helper.errorMsg, "NOT_AUTHORIZED")
	}

	func test_success_getDetailOfBusinesses() async throws {
		let expectation = self.expectation(description: "DetailOfBusinesses")

		await helper.stubGetDetailOfBusiness()

		expectation.fulfill()

		await waitForExpectations(timeout: 5)

		XCTAssertEqual(helper.detail?.name, "Starbucks Tests")
	}

	func test_errorUnauthorized_getDetailOfBusinesses() async throws {
		let expectation = self.expectation(description: "ErrorDetailOfBusinesses")

		await helper.stubErrorOfDetailBusinessRequest()

		expectation.fulfill()

		await waitForExpectations(timeout: 5)

		XCTAssertEqual(helper.errorMsg, "NOT_AUTHORIZED")
	}
}
