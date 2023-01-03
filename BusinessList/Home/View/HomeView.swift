//
//  HomeView.swift
//  BusinessList
//
//  Created by Gus Adi on 30/12/22.
//

import SwiftUI

struct HomeView: View {
	var body: some View {
		List {
			ForEach(0...6, id: \.self) { item in
				Text("item \(item)")
			}
		}
		.listStyle(.plain)
		.navigationTitle(Text("Home"))
		.navigationBarTitleDisplayMode(.large)
	}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
		HomeView()
    }
}
