//
//  DetailView.swift
//  BusinessList
//
//  Created by Gus Adi on 06/01/23.
//

import SwiftUI

struct DetailView: View {

	@ObservedObject var viewModel: DetailViewModel

    var body: some View {
		Text("Hello, \(viewModel.id)")
			.navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(id: ""))
    }
}
