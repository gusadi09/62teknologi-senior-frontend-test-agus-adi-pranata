//
//  TabGroupView.swift
//  BusinessList
//
//  Created by Gus Adi on 03/01/23.
//

import SwiftUI

struct TabGroupView: View {
    var body: some View {
		TabView {
			NavigationView {
				HomeView()
			}
			.tabItem {
				VStack {
					Image(systemName: "house.fill")
					Text("Home")
				}
			}

			NavigationView {
				HomeView()
			}
			.tabItem {
				VStack {
					Image(systemName: "magnifyingglass")
					Text("Search")
				}
			}
		}
	}
}

struct TabGroupView_Previews: PreviewProvider {
    static var previews: some View {
        TabGroupView()
    }
}
