//
//  DetailView.swift
//  BusinessList
//
//  Created by Gus Adi on 06/01/23.
//

import BusinessListDesignSystem
import SwiftUI
import CoreLocation

struct DetailView: View {

	@ObservedObject var viewModel: DetailViewModel

	var body: some View {
		GeometryReader { geo in
			ZStack {
				ScrollView {
					LazyVStack(spacing: 20) {
						TabView {
							ForEach(viewModel.detail?.photos ?? [], id: \.self) { item in
								ImageLoader(url: item, width: geo.size.width, height: geo.size.height/3)
							}

						}
						.tabViewStyle(.page(indexDisplayMode: .always))
						.tag("top")
						.id("top")
						.frame(width: geo.size.width, height: geo.size.height/3)

						VStack(spacing: 10) {
							Text((viewModel.name))
								.font(.system(size: 16, weight: .bold))
								.foregroundColor(.BusinessDefault.primary)

							HStack(alignment: .top, spacing: 5) {
								Image(systemName: "mappin")
									.foregroundColor(.BusinessDefault.primary)

								Text(viewModel.displayStreetText())
									.foregroundColor(.BusinessDefault.primary)
							}
						}

						ShortDetailSection(parentViewModel: viewModel)
							.padding(.horizontal)

						OpeningHoursSection(parentViewModel: viewModel)
							.padding(.horizontal)

						LazyVStack(alignment: .leading, pinnedViews: .sectionHeaders) {

							Section {
								MapView(parentViewModel: viewModel, geo: geo)
									.padding(.horizontal)
							} header: {
								Text(LocalizationText.locationText)
									.font(.system(size: 16, weight: .bold))
									.foregroundColor(.BusinessDefault.primary)
									.padding(.horizontal)
									.padding(.vertical, 10)
									.frame(maxWidth: .infinity, alignment: .leading)
									.background(Color.BusinessDefault.transversalBlackWhite)
							}
						}

						LazyVStack(alignment: .leading, pinnedViews: .sectionHeaders) {

							Section {
								ReviewSection(parentViewModel: viewModel)
							} header: {
								Text(LocalizationText.reviewsText)
									.font(.system(size: 16, weight: .bold))
									.foregroundColor(.BusinessDefault.primary)
									.padding(.horizontal)
									.padding(.vertical, 10)
									.frame(maxWidth: .infinity, alignment: .leading)
									.background(Color.BusinessDefault.transversalBlackWhite)
							}
						}

						if viewModel.isLoadingReview {
							HStack {
								Spacer()
								ProgressView()
									.progressViewStyle(.circular)
								Spacer()
							}
						}
					}
				}
				.refreshable {
					viewModel.onRefresh()
				}

				if viewModel.isLoading {

					ProgressView()
						.progressViewStyle(.circular)
						.padding(40)
						.background(.ultraThinMaterial)
						.clipShape(RoundedRectangle(cornerRadius: 10))
				}
			}

		}
		.navigationTitle(Text(viewModel.name))
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			Button {

			} label: {
				Image(systemName: "paperplane.fill")
			}

		}
		.onAppear(perform: {
			viewModel.onAppear()
		})
	}
}

extension DetailView {
	struct ShortDetailSection: View {

		@ObservedObject var parentViewModel: DetailViewModel

		var body: some View {
			VStack(spacing: 15) {
				HStack(alignment: .center) {
					VStack(alignment: .leading, spacing: 5) {
						HStack {
							Text(LocalizationText.priceRangeText)
								.font(.system(size: 14, weight: .bold))

							Spacer()
						}

						Text(parentViewModel.priceRangeText())
							.font(.system(size: 12, weight: .semibold))
							.foregroundColor(.BusinessDefault.primary)
					}

					Spacer()

					if parentViewModel.detail?.isClosed ?? false {
						Text(LocalizationText.closedText)
							.font(.system(size: 12, weight: .semibold))
							.foregroundColor(.red)
							.padding(.horizontal, 10)
							.padding(.vertical, 5)
							.background(
								Capsule()
									.foregroundColor(.BusinessDefault.softRed)
							)
							.overlay(
								Capsule()
									.stroke(Color.red, lineWidth: 1)
							)
					}
				}

				HStack(alignment: .center) {
					VStack(alignment: .leading, spacing: 5) {
						HStack {
							Text(LocalizationText.categoriesText)
								.font(.system(size: 14, weight: .bold))

							Spacer()
						}

						Text(parentViewModel.categoriesText())
							.font(.system(size: 12, weight: .semibold))
							.foregroundColor(.BusinessDefault.primary)
					}

					Spacer()

					VStack(alignment: .trailing, spacing: 5) {
						HStack {

							Spacer()
							Text(LocalizationText.ratingText)
								.font(.system(size: 14, weight: .bold))
						}


						HStack(alignment: .center, spacing: 5) {
							Image(systemName: "star.fill")
								.foregroundColor(.yellow)

							Text(
								String(
									format: "%.1f",
									(
										parentViewModel.detail?.rating
									).orZero()
								)
							)
							.font(.system(size: 12, weight: .semibold))
							.foregroundColor(.BusinessDefault.primary)
						}
					}
				}

				VStack(alignment: .leading, spacing: 5) {
					HStack {
						Text(LocalizationText.phoneText)
							.font(.system(size: 14, weight: .bold))

						Spacer()
					}

					Text((parentViewModel.detail?.displayPhone).orEmpty())
						.font(.system(size: 12, weight: .semibold))
						.foregroundColor(.BusinessDefault.primary)
				}

				VStack(alignment: .leading, spacing: 5) {
					HStack {
						Text(LocalizationText.featuredTransactionText)
							.font(.system(size: 14, weight: .bold))

						Spacer()
					}

					Text(parentViewModel.transactionText())
						.font(.system(size: 12, weight: .semibold))
						.foregroundColor(.BusinessDefault.primary)
				}
			}
			.padding()
			.background(
				RoundedRectangle(cornerRadius: 10)
					.foregroundColor(.BusinessDefault.transversalBlackWhite)
					.shadow(color: .BusinessDefault.basicWhiteBlack.opacity(0.2),radius: 8)
			)
		}
	}

	struct OpeningHoursSection: View {
		@ObservedObject var parentViewModel: DetailViewModel

		var body: some View {
			VStack(spacing: 15) {
				HStack(alignment: .center) {
					VStack(alignment: .leading, spacing: 5) {
						HStack {
							Text(LocalizationText.openHoursText)
								.font(.system(size: 14, weight: .bold))

							Spacer()
						}

						ForEach(parentViewModel.openingHours(), id: \.self) { item in
							Text(item)
								.font(.system(size: 12, weight: .semibold))
								.foregroundColor(.BusinessDefault.primary)
						}
					}
				}
			}
			.padding()
			.background(
				RoundedRectangle(cornerRadius: 10)
					.foregroundColor(.BusinessDefault.transversalBlackWhite)
					.shadow(color: .BusinessDefault.basicWhiteBlack.opacity(0.2),radius: 8)
			)
		}
	}

	struct MapView: View {
		@ObservedObject var parentViewModel: DetailViewModel
		let geo: GeometryProxy

		var body: some View {
			MapsView(
				markerTitle: (parentViewModel.detail?.name).orEmpty(),
				markerSnippet: (parentViewModel.displayStreetText()),
				latitude: CLLocationDegrees(
					(parentViewModel.detail?.coordinates?.latitude ?? 0.0)
				),
				longitude: CLLocationDegrees(
					(parentViewModel.detail?.coordinates?.longitude ?? 0.0)
				)
			)
			.frame(height: geo.size.height/4)
			.cornerRadius(10)
		}
	}

	struct ReviewSection: View {

		@ObservedObject var parentViewModel: DetailViewModel

		var body: some View {
			LazyVStack(spacing: 10) {
				ForEach(parentViewModel.reviews, id: \.id) { item in
					ReviewCard(data: item)
						.padding(.horizontal)
						.padding(.vertical, 5)
						.onAppear {
							parentViewModel.onGetNextPage(item: item)
						}

					Divider()
						.padding(.leading)
				}
			}
		}
	}
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		DetailView(viewModel: DetailViewModel(alias: "", name: ""))
	}
}
