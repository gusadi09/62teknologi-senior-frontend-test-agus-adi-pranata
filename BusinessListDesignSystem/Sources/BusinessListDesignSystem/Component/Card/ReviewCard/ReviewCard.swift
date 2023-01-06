//
//  ReviewCard.swift
//  
//
//  Created by Gus Adi on 07/01/23.
//

import BusinessListData
import SwiftUI

public struct ReviewCard: View {

	private let data: ReviewData

	public init(data: ReviewData) {
		self.data = data
	}

	public var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			HStack(alignment: .center, spacing: 15) {
				ImageLoader(url: (data.user?.imageUrl).orEmpty(), width: 40, height: 40)
					.clipShape(Circle())

				VStack(alignment: .leading, spacing: 8) {
					HStack {
						Text((data.user?.name).orEmpty())
							.font(.system(size: 14, weight: .bold))
							.multilineTextAlignment(.leading)

						Spacer()
					}

					StarRatingView(rating: .constant(Double(data.rating.orZero())), maxRating: 5)

				}
			}

			Text(data.text.orEmpty())
				.font(.system(size: 14))
				.multilineTextAlignment(.leading)
		}
	}
}

struct ReviewCard_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			ReviewCard(
				data: ReviewData.sample
			)
		}
		.frame(width: 375, height: 667)
	}
}
