//
//  Localization.swift
//  
//
//  Created by Gus Adi on 03/01/23.
//

import Foundation

public enum LocalizationText {
	public static let homeTabText = NSLocalizedString(
		"home_tab_text",
		bundle: .module,
		comment: "usage for tab text when on home page"
	)
	
	public static let searchTabText = NSLocalizedString(
		"search_tab_text",
		bundle: .module,
		comment: "usage for tab text when on search page"
	)
}
