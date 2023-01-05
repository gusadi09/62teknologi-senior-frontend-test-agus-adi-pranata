//
//  ImageLoader.swift
//  
//
//  Created by Gus Adi on 05/01/23.
//

import SwiftUI

public struct ImageLoader: View {

	private let url: String
	private let size: CGFloat

	public init(url: String, size: CGFloat = .infinity) {
		self.url = url
		self.size = size
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
				.scaledToFit()
				.frame(height: size)

			case .failure(_):
				Image.failureLoadImage
					.resizable()
					.scaledToFit()
					.frame(height: size)

			case .success(let image):
				image
					.resizable()
					.scaledToFit()
					.frame(height: size)
			@unknown default:
				Image.failureLoadImage
					.resizable()
					.scaledToFit()
					.frame(height: size)
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
