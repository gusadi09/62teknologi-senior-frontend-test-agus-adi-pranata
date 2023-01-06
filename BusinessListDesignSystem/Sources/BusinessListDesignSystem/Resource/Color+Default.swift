//
//  Color+Default.swift
//  
//
//  Created by Gus Adi on 05/01/23.
//

import Foundation
import SwiftUI

public extension Color {
	enum BusinessDefault {
		public static let primary = Color("primary", bundle: .module)
		public static let transversalBlackWhite = Color("transversalBlackWhite", bundle: .module)
		public static let basicWhiteBlack = Color("basicWhiteBlack", bundle: .module)
		public static let softRed = Color("softRed", bundle: .module)
	}
}
