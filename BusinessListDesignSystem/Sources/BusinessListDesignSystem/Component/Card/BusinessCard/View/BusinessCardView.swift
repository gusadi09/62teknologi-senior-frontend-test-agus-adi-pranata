//
//  BusinessCardView.swift
//  
//
//  Created by Gus Adi on 05/01/23.
//

import BusinessListData
import SwiftUI

struct BusinessCardView: View {

	@ObservedObject var viewModel: BusinessCardViewModel

    var body: some View {
		VStack {
			Text("Hello")
				.padding()
		}
		.background(Color.white)
		.clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			BusinessCardView(
				viewModel: BusinessCardViewModel(
					cardData: BusinessData.sample
				)
			)
		}
		.frame(width: 375, height: 667)
	}
}
