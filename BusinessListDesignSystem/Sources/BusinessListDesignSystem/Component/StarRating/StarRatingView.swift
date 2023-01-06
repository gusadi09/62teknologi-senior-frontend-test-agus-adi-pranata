//
//  StarRatingView.swift
//  
//
//  Created by Gus Adi on 07/01/23.
//

import SwiftUI

public struct StarRatingView: View {
	public struct ClipShape: Shape {
		public let width: Double

		init(width: Double) {
			self.width = width
		}

		public func path(in rect: CGRect) -> Path {
			Path(CGRect(x: rect.minX, y: rect.minY, width: width, height: rect.height))
		}
	}

	@Binding public var rating: Double
	public let maxRating: Int

	public init(rating: Binding<Double>, maxRating: Int) {
		self.maxRating = maxRating
		self._rating = rating
	}

	public var body: some View {
		HStack(spacing: 0) {
			ForEach(0..<maxRating, id: \.self) { _ in
				Text(Image(systemName: "star"))
					.foregroundColor(.blue)
					.aspectRatio(contentMode: .fill)
			}
		}.overlay(
			GeometryReader { reader in
				HStack(spacing: 0) {
					ForEach(0..<maxRating, id: \.self) { _ in
						Image(systemName: "star.fill")
							.foregroundColor(.blue)
							.aspectRatio(contentMode: .fit)
					}
				}
				.clipShape(
					ClipShape(width: (reader.size.width / CGFloat(maxRating)) * CGFloat(rating))
				)
			}
		)
	}
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
		StarRatingView(rating: .constant(1.0), maxRating: 5)
    }
}
