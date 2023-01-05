//
//  SearchView.swift
//  BusinessList
//
//  Created by Gus Adi on 30/12/22.
//

import BusinessListDesignSystem
import BusinessListData
import SwiftUI

struct SearchView: View {

	@ObservedObject var viewModel = SearchViewModel()

	var body: some View {
		GeometryReader { geo in
			MainContent(parentViewModel: viewModel, geo: geo)
		}
		.onAppear {
			viewModel.onAppear()
		}
		.onChange(of: viewModel.query.term) { _ in
			viewModel.startSearch()
		}
		.onChange(of: viewModel.query.sortBy, perform: { _ in
			viewModel.onAppear()
		})
		.onChange(of: viewModel.query.attributes, perform: { _ in
			viewModel.onAppear()
		})
		.searchable(text: $viewModel.query.term)
		.navigationTitle(Text(LocalizationText.searchTabText))
		.navigationBarTitleDisplayMode(.large)
		.toolbar {
			Button {
				viewModel.toogleFilter()
			} label: {
				Image(systemName: "line.3.horizontal.decrease")
			}

		}
		.sheet(isPresented: $viewModel.isShowFilterSort) {
			VStack(alignment: .leading, spacing: 25) {
				SortView(parentViewModel: viewModel)

				FilterView(parentViewModel: viewModel)
			}
			.padding()
			.presentationDetents([.fraction(0.3), .medium])
		}
	}

}

extension SearchView {

	struct SortView: View {

		@ObservedObject var parentViewModel: SearchViewModel

		var body: some View {
			VStack(alignment: .leading, spacing: 15) {
				Text(LocalizationText.sortText)
					.font(.system(size: 16, weight: .bold))
					.foregroundColor(.BusinessDefault.basicWhiteBlack)

				LazyVGrid(columns: [GridItem(.adaptive(minimum: 95), spacing: 3, alignment: .center)], spacing: 5) {
					CapsuleTextButton(
						selected: $parentViewModel.query.sortBy,
						value: SortType.bestMatch.rawValue,
						text: LocalizationText.bestMatchText,
						selectedColor: .blue,
						unselectedColor: .gray
					) {
						parentViewModel.changeSortType(by: SortType.bestMatch.rawValue)
					}

					CapsuleTextButton(
						selected: $parentViewModel.query.sortBy,
						value: SortType.rating.rawValue,
						text: LocalizationText.bestRatingText,
						selectedColor: .blue,
						unselectedColor: .gray
					) {
						parentViewModel.changeSortType(by: SortType.rating.rawValue)
					}

					CapsuleTextButton(
						selected: $parentViewModel.query.sortBy,
						value: SortType.reviewCount.rawValue,
						text: LocalizationText.mostReviewedText,
						selectedColor: .blue,
						unselectedColor: .gray
					) {
						parentViewModel.changeSortType(by: SortType.reviewCount.rawValue)
					}
				}
			}
		}
	}

	struct FilterView: View {

		@ObservedObject var parentViewModel: SearchViewModel

		var body: some View {
			VStack(alignment: .leading, spacing: 15) {
				Text(LocalizationText.filterText)
					.font(.system(size: 16, weight: .bold))
					.foregroundColor(.BusinessDefault.basicWhiteBlack)

				LazyVGrid(columns: [GridItem(.adaptive(minimum: 95), spacing: 3, alignment: .center)], spacing: 5) {
					CapsuleTextButton(
						selected: $parentViewModel.query.attributes,
						value: FilterType.hotAndNew.rawValue,
						text: LocalizationText.hotAndNewText,
						selectedColor: .blue,
						unselectedColor: .gray
					) {
						parentViewModel.changeFilterType(by: FilterType.hotAndNew.rawValue)
					}

					CapsuleTextButton(
						selected: $parentViewModel.query.attributes,
						value: FilterType.openToAll.rawValue,
						text: LocalizationText.openToAllText,
						selectedColor: .blue,
						unselectedColor: .gray
					) {
						parentViewModel.changeFilterType(by: FilterType.openToAll.rawValue)
					}

					CapsuleTextButton(
						selected: $parentViewModel.query.attributes,
						value: FilterType.deals.rawValue,
						text: LocalizationText.bestDealsText,
						selectedColor: .blue,
						unselectedColor: .gray
					) {
						parentViewModel.changeFilterType(by: FilterType.deals.rawValue)
					}
				}
			}
		}
	}
	struct LoadingView: View {
		var body: some View {
			VStack {

				Spacer()

				HStack {
					Spacer()

					ProgressView()
						.progressViewStyle(.circular)

					Spacer()
				}

				Spacer()

			}
		}
	}

	struct MainContent: View {

		@ObservedObject var parentViewModel: SearchViewModel
		let geo: GeometryProxy

		var body: some View {
			List {
				ForEach(parentViewModel.businessesData, id: \.id) { item in
					BusinessCardView(
						viewModel: BusinessCardViewModel(cardData: item),
						imageWidth: geo.size.width/1.2,
						imageHeight: geo.size.height/3
					)
					.shadow(color: .BusinessDefault.basicWhiteBlack.opacity(0.15), radius: 5)
					.onAppear(perform: {
						parentViewModel.onGetNextPage(item: item)
					})
					.listRowSeparator(.hidden)
				}

				if parentViewModel.isLoading {
					LoadingView()
						.listRowSeparator(.hidden)
				}
			}
			.listStyle(.plain)
			.refreshable {
				await parentViewModel.getListOfBusinesses()
			}
		}
	}
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
		SearchView()
    }
}
