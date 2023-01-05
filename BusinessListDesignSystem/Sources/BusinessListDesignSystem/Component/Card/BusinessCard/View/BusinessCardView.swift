//
//  BusinessCardView.swift
//  
//
//  Created by Gus Adi on 05/01/23.
//

import BusinessListData
import SwiftUI

public struct BusinessCardView: View {

	@ObservedObject var viewModel: BusinessCardViewModel
	private let imageWidth: CGFloat
	private let imageHeight: CGFloat

	public init(
		viewModel: BusinessCardViewModel,
		imageWidth: CGFloat = .infinity,
		imageHeight: CGFloat = .infinity
	) {
		self.viewModel = viewModel
		self.imageWidth = imageWidth
		self.imageHeight = imageHeight
	}

	public var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			ImageLoader(
				url: viewModel.cardData.imageUrl.orEmpty(),
				size: imageWidth
			)
			.frame(height: imageHeight)
				.clipShape(RoundedRectangle(cornerRadius: 10))

			HStack(alignment: .center) {
				Text(viewModel.cardData.name.orEmpty())
					.font(.title2)
					.bold()
					.foregroundColor(.BusinessDefault.primary)
					.multilineTextAlignment(.leading)

				Spacer()

				HStack(alignment: .center, spacing: 5) {
					Image(systemName: "star.fill")
						.foregroundColor(.yellow)

					Text(
						String(format: "%.1f", viewModel.cardData.rating.orZero())
					)
					.font(.system(size: 12, weight: .bold))
				}
			}

			HStack(alignment: .center) {

				Text(
					viewModel.displayStreetText()
				)
				.multilineTextAlignment(.leading)

				Spacer()

				(
					Text(
						"\(viewModel.cardData.price.orEmpty()) • "
					)
					.fontWeight(.semibold)
					+
					Text(
						viewModel.categoriesText()
					)
				)
				.multilineTextAlignment(.trailing)

			}

			if viewModel.cardData.isClosed ?? false {
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
		.padding()
		.background(Color.BusinessDefault.transversalBlackWhite)
		.clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct BusinessCardView_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			GeometryReader { geo in
				ScrollView {
					ForEach(0...2, id: \.self) { _ in
						BusinessCardView(
							viewModel: BusinessCardViewModel(
								cardData: BusinessData.sample
							),
							imageWidth: geo.size.width,
							imageHeight: geo.size.height/3
						)
					}
				}
			}
		}
		.frame(width: 375, height: 667)
	}
}
