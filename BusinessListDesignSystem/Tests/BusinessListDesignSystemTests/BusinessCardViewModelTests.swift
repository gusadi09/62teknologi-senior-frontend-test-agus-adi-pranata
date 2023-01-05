import XCTest
import BusinessListData
@testable import BusinessListDesignSystem

final class BusinessCardViewModelTests: XCTestCase {

	let sut = BusinessCardViewModel(cardData: BusinessData.sample)

    func test_checkTheCategoriesName() throws {
		XCTAssertEqual(sut.categoriesText(), "Cafe")
    }

	func test_checkTheDisplayAddress() throws {
		XCTAssertEqual(sut.displayStreetText(), "New York City")
	}
}
