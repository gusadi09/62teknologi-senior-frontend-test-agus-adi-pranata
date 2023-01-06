//
//  DetailViewModel.swift
//  BusinessList
//
//  Created by Gus Adi on 06/01/23.
//

import BusinessListDesignSystem
import BusinessListData
import Foundation
import UIKit

final class DetailViewModel: ObservableObject {

	private let repository: BusinessRepository

	@Published var alias: String
	@Published var name: String
	@Published var reviews = [ReviewData]()

	@Published var query = ReviewsQueryParam()

	@Published var detail: DetailBusinessResponse?

	@Published var isLoading = false
	@Published var isLoadingReview = false
	@Published var isError = false
	@Published var errorMsg = ""

	init(alias: String, name: String, repository: BusinessRepository = BusinessDefaultRepository()) {
		self.alias = alias
		self.name = name
		self.repository = repository
	}

	func onRefresh() {
		query.limit = 10

		onAppear()
	}

	func priceRangeText() -> String {
		switch (detail?.price).orEmpty() {
		case "$":
			return "$ (\(LocalizationText.cheapText))"
		case "$$":
			return "$$ (\(LocalizationText.cheapText))"
		case "$$$":
			return "$$$ (\(LocalizationText.moderateText))"
		case "$$$$":
			return "$$$$ (\(LocalizationText.expensiveText))"
		case "$$$$$":
			return "$$$$$ (\(LocalizationText.expensiveText))"
		default:
			return (detail?.price).orEmpty()
		}
	}

	func categoriesText() -> String {
		let mapped = detail?.categories?.compactMap({
			$0.title.orEmpty()
		}) ?? []

		return mapped.joined(separator: ", ")
	}

	func transactionText() -> String {
		return (detail?.transactions ?? []).joined(separator: ", ")
	}

	func openingHours() -> [String] {
		(detail?.hours?.first(where: { $0.hoursType.orEmpty() == "REGULAR" })?.open ?? []).compactMap { item in
			var startTime = item.start.orEmpty()
			var endTime = item.end.orEmpty()

			startTime.insert(":", at: startTime.index(startTime.startIndex, offsetBy: 2))
			endTime.insert(":", at: endTime.index(endTime.startIndex, offsetBy: 2))

			return "\(stringDay(by: item.day.orZero())) (\(startTime) - \(endTime))"
		}
	}

	func stringDay(by item: Int) -> String {
		switch item {
		case 0:
			return LocalizationText.mondayText
		case 1:
			return LocalizationText.tuesdayText
		case 2:
			return LocalizationText.wednesdayText
		case 3:
			return LocalizationText.thursdayText
		case 4:
			return LocalizationText.fridayText
		case 5:
			return LocalizationText.saturdayText
		case 6:
			return LocalizationText.sundayText
		default:
			return ""
		}
	}

	func displayStreetText() -> String {
		(
			detail?.location?.displayAddress ?? []
		).joined(separator: ", ")
	}

	func onGetNextPage(item: ReviewData) {
		if item.id == reviews.last?.id {
			query.limit += 10
			loadNextReview()
		}
	}

	func loadNextReview() {
		Task {
			await getReviewsOfBusinesses()
		}
	}

	func onAppear() {
		Task {
			await getDetailOfBusinesses()
			await getReviewsOfBusinesses()
		}
	}

	func onStartFetch() {
		DispatchQueue.main.async { [weak self] in
			self?.isError = false
			self?.isLoading = true
			self?.errorMsg = ""
		}
	}

	func onStartFetchReview() {
		DispatchQueue.main.async { [weak self] in
			self?.isError = false
			self?.isLoadingReview = true
			self?.errorMsg = ""
		}
	}

	func openURL() {
		if let url = URL(string: (detail?.messaging?.url).orEmpty()) {
			UIApplication.shared.open(url)
		}
	}

	func getDetailOfBusinesses() async {
		onStartFetch()

		do {
			let result = try await repository.provideGetDetailOfBusiness(by: alias)

			DispatchQueue.main.async {[weak self] in
				self?.isLoading = false
				self?.detail = result
			}

		} catch (let error as ErrorResponse) {
			DispatchQueue.main.async { [weak self] in
				self?.isLoading = false
				self?.isError = true
				self?.errorMsg = (error.error?.description).orEmpty()
			}
		} catch (let err) {
			DispatchQueue.main.async { [weak self] in
				self?.isLoading = false
				self?.isError = true
				self?.errorMsg = err.localizedDescription
			}
		}
	}

	func getReviewsOfBusinesses() async {
		onStartFetchReview()

		do {
			let result = try await repository.provideGetReviewsOfBusiness(by: alias, with: query)

			DispatchQueue.main.async {[weak self] in
				self?.isLoadingReview = false
				self?.reviews = result.reviews ?? []
			}

		} catch (let error as ErrorResponse) {
			DispatchQueue.main.async { [weak self] in
				self?.isLoadingReview = false
				self?.isError = true
				self?.errorMsg = (error.error?.description).orEmpty()
			}
		} catch (let err) {
			DispatchQueue.main.async { [weak self] in
				self?.isLoadingReview = false
				self?.isError = true
				self?.errorMsg = err.localizedDescription
			}
		}
	}
}
