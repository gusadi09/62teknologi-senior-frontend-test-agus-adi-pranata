//
//  ImageLoader.swift
//  
//
//  Created by Gus Adi on 05/01/23.
//

import SwiftUI

public struct ImageLoader: View {

	private let url: String
	private let width: CGFloat
	private let height: CGFloat

	public init(url: String, width: CGFloat = .infinity, height: CGFloat = .infinity) {
		self.url = url
		self.width = width
		self.height = height
	}

    public var body: some View {
		AsyncImage(url: URL(string: url)) { phase in
			switch phase {
			case .empty:
				HStack {
					Spacer()

					ProgressView()
						.progressViewStyle(.circular)

					Spacer()
				}
				.scaledToFill()
				.frame(width: width, height: height)

			case .failure(_):
				Image.failureLoadImage
					.resizable()
					.scaledToFill()
					.frame(width: width, height: height)

			case .success(let image):
				image
					.resizable()
					.scaledToFill()
					.frame(width: width, height: height)
			@unknown default:
				Image.failureLoadImage
					.resizable()
					.scaledToFill()
					.frame(width: width, height: height)
			}
		}
    }
}

struct ImageLoader_Previews: PreviewProvider {
    static var previews: some View {
		VStack {
			ImageLoader(url: "https://res.cloudinary.com/demo/image/upload/v1312461204/sample.jpg")
		}
		.frame(width: 375, height: 667)
    }
}
