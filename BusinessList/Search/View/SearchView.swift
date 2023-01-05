//
//  SearchView.swift
//  BusinessList
//
//  Created by Gus Adi on 30/12/22.
//

import BusinessListDesignSystem
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
		.navigationTitle(Text(LocalizationText.searchTabText))
		.navigationBarTitleDisplayMode(.large)
		.searchable(text: $viewModel.query.term)
		.onChange(of: viewModel.query.term) { _ in
			viewModel.startSearch()
		}
	}

}

extension SearchView {
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
					.shadow(color: .black.opacity(0.08), radius: 10)
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
