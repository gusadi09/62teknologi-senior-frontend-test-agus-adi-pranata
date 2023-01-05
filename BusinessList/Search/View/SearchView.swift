//
//  SearchView.swift
//  BusinessList
//
//  Created by Gus Adi on 30/12/22.
//

import BusinessListDesignSystem
import SwiftUI

struct SearchView: View {
	var body: some View {
		List {
			ForEach(0...6, id: \.self) { item in
				Text("item \(item)")
			}
		}
		.listStyle(.plain)
		.navigationTitle(Text(LocalizationText.searchTabText))
		.navigationBarTitleDisplayMode(.large)
	}
}

struct SeearchView_Previews: PreviewProvider {
    static var previews: some View {
		SearchView()
    }
}
