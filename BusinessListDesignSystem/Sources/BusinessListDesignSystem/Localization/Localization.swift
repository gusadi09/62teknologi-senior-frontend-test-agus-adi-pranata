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

	public static let closedText = NSLocalizedString(
		"closed_text",
		bundle: .module,
		comment: "usage for closed text label"
	)

	public static let filterText = NSLocalizedString(
		"filter_text",
		bundle: .module,
		comment: "usage for filter text label"
	)

	public static let sortText = NSLocalizedString(
		"sort_text",
		bundle: .module,
		comment: "usage for sort text label"
	)

	public static let bestMatchText = NSLocalizedString(
		"best_match_text",
		bundle: .module,
		comment: "usage for best match text label"
	)

	public static let mostReviewedText = NSLocalizedString(
		"most_reviewed_text",
		bundle: .module,
		comment: "usage for most reviewed text label"
	)

	public static let bestRatingText = NSLocalizedString(
		"best_rating_text",
		bundle: .module,
		comment: "usage for best rating text label"
	)

	public static let hotAndNewText = NSLocalizedString(
		"hot_and_new_text",
		bundle: .module,
		comment: "usage for hot and new text label"
	)

	public static let openToAllText = NSLocalizedString(
		"open_to_all_text",
		bundle: .module,
		comment: "usage for open to all text label"
	)

	public static let bestDealsText = NSLocalizedString(
		"best_deals_text",
		bundle: .module,
		comment: "usage for best deals text label"
	)
}
