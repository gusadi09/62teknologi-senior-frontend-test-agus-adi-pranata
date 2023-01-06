//
//  DetailView.swift
//  BusinessList
//
//  Created by Gus Adi on 06/01/23.
//

import BusinessListDesignSystem
import SwiftUI

struct DetailView: View {

	@ObservedObject var viewModel: DetailViewModel

	var body: some View {
		GeometryReader { geo in
			ScrollViewReader { proxy in
				ZStack(alignment: .bottomTrailing) {
					ScrollView {
						LazyVStack(spacing: 20) {
							TabView {
								ForEach(0...3, id: \.self) { _ in
									ImageLoader(url: "https://images.seattletimes.com/wp-content/uploads/2022/05/202205171247MCT_____PHOTO____BIZ-WRK-CPT-GOOGLE-CAMPUS-SJ.jpg", width: geo.size.width, height: geo.size.height/3)
								}

							}
							.tabViewStyle(.page(indexDisplayMode: .always))
							.tag("top")
							.id("top")
							.frame(width: geo.size.width, height: geo.size.height/3)

							VStack(spacing: 10) {
								Text("Levain Bakery")
									.font(.system(size: 16, weight: .bold))
									.foregroundColor(.BusinessDefault.primary)

								HStack(alignment: .top, spacing: 5) {
									Image(systemName: "mappin")
										.foregroundColor(.BusinessDefault.primary)

									Text("New York City")
										.foregroundColor(.BusinessDefault.primary)
								}
							}

							ShortDetailSection(parentViewModel: viewModel)
								.padding(.horizontal)

							OpeningHoursSection(parentViewModel: viewModel)
								.padding(.horizontal)

							MapView(parentViewModel: viewModel, geo: geo)
								.padding(.horizontal)
						}
					}
					.refreshable {

					}

					Button {
						withAnimation(.spring()) {
							proxy.scrollTo("top")
						}

					} label: {
						Image(systemName: "chevron.up")
							.font(.system(size: 20, weight: .bold, design: .rounded))
							.padding()
							.background(
								Circle()
									.foregroundColor(.BusinessDefault.transversalBlackWhite)
									.shadow(color: .BusinessDefault.basicWhiteBlack.opacity(0.1), radius: 10)
							)
					}
					.padding(.horizontal)

				}

			}

		}
		.navigationTitle(Text("Businesses Name"))
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			Button {

			} label: {
				Image(systemName: "paperplane.fill")
			}

		}
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
							Text("Price Range:")
								.font(.system(size: 14, weight: .bold))

							Spacer()
						}

						Text("$$ (Moderate)")
							.font(.system(size: 12, weight: .semibold))
							.foregroundColor(.BusinessDefault.primary)
					}

					Spacer()

					if true {
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
							Text("Categories:")
								.font(.system(size: 14, weight: .bold))

							Spacer()
						}

						Text("Cafe, Bakeries")
							.font(.system(size: 12, weight: .semibold))
							.foregroundColor(.BusinessDefault.primary)
					}

					Spacer()

					VStack(alignment: .trailing, spacing: 5) {
						HStack {

							Spacer()
							Text("Rating:")
								.font(.system(size: 14, weight: .bold))
						}


						HStack(alignment: .center, spacing: 5) {
							Image(systemName: "star.fill")
								.foregroundColor(.yellow)

							Text(
								String(format: "%.1f", 4.5)
							)
							.font(.system(size: 12, weight: .semibold))
							.foregroundColor(.BusinessDefault.primary)
						}
					}
				}

				VStack(alignment: .leading, spacing: 5) {
					HStack {
						Text("Phone:")
							.font(.system(size: 14, weight: .bold))

						Spacer()
					}

					Text("08378278723")
						.font(.system(size: 12, weight: .semibold))
						.foregroundColor(.BusinessDefault.primary)
				}

				VStack(alignment: .leading, spacing: 5) {
					HStack {
						Text("Available Special Transaction:")
							.font(.system(size: 14, weight: .bold))

						Spacer()
					}

					Text("Delivery, QRIS")
						.font(.system(size: 12, weight: .semibold))
						.foregroundColor(.BusinessDefault.primary)
				}
			}
			.padding()
			.background(
				RoundedRectangle(cornerRadius: 10)
					.foregroundColor(.BusinessDefault.transversalBlackWhite)
					.shadow(color: .BusinessDefault.basicWhiteBlack.opacity(0.1),radius: 8)
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
							Text("Open Hours:")
								.font(.system(size: 14, weight: .bold))

							Spacer()
						}

						ForEach(0...6, id: \.self) { _ in
							Text("Monday (08:00 - 21:00)")
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
					.shadow(color: .BusinessDefault.basicWhiteBlack.opacity(0.1),radius: 8)
			)
		}
	}

	struct MapView: View {
		@ObservedObject var parentViewModel: DetailViewModel
		let geo: GeometryProxy

		var body: some View {
			MapsView(markerTitle: "Levain Bakery", markerSnippet: "New York", latitude: 40.779961, longitude: -73.980299)
				.frame(height: geo.size.height/4)
				.cornerRadius(10)
		}
	}

	struct ReviewSection: View {

		@ObservedObject var parentViewModel: DetailViewModel

		var body: some View {
			Text("Review")
		}
	}
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(alias: ""))
    }
}
