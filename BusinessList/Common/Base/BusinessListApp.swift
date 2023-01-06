//
//  BusinessListApp.swift
//  BusinessList
//
//  Created by Gus Adi on 30/12/22.
//

import BusinessListDesignSystem
import SwiftUI

@main
struct BusinessListApp: App {
    var body: some Scene {
        WindowGroup {
			NavigationView {
				SearchView()
			}
			.onAppear {
				MapsServices.provideApiKey("AIzaSyCecz-EgCly86Sii9Nfe2CoI3szQt1SwUw")
			}
        }
    }
}
