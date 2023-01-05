//
//  HomeViewModel.swift
//  BusinessList
//
//  Created by Gus Adi on 30/12/22.
//

import BusinessListData
import Foundation

final class SearchViewModel: ObservableObject {

	private let repository: BusinessRepository
	private var timer: Timer?

	@Published var isLoading = false
	@Published var isError = false
	@Published var errorMsg = ""

	@Published var isShowFilterSort = false

	@Published var query = BusinessesRequestParam(term: "")

	@Published var businessesData = [BusinessData]()
	@Published var data: BusinessResponse?

	init(repository: BusinessRepository = BusinessDefaultRepository()) {
		self.repository = repository
	}

	func onGetNextPage(item: BusinessData) {
		if item.id == businessesData.last?.id {
			query.limit += 10
			onAppear()
		}
	}

	func onAppear() {
		Task {
			await getListOfBusinesses()
		}
	}

	func toogleFilter() {
		isShowFilterSort.toggle()
	}

	func onStartFetch() {
		DispatchQueue.main.async { [weak self] in
			self?.isError = false
			self?.isLoading = true
			self?.errorMsg = ""
		}
	}

	func getListOfBusinesses() async {
		onStartFetch()

		do {
			let result = try await repository.provideGetListOfBusinesses(with: query)

			DispatchQueue.main.async {[weak self] in
				self?.isLoading = false
				self?.businessesData = result.businesses ?? []
				self?.data = result
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

	@objc func onSearch() {
		Task {
			await getListOfBusinesses()
		}
	}

	func startSearch() {
		if let timer = timer {
			timer.invalidate()
		}

		timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(onSearch), userInfo: nil, repeats: false)
	}
}
