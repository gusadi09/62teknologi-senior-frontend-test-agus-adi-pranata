//
//  CapsuleTextButton.swift
//  
//
//  Created by Gus Adi on 06/01/23.
//

import SwiftUI

public struct CapsuleTextButton: View {

	private let text: String
	private let textColor: Color
	private let value: String
	private let selectedColor: Color
	private let unselectedColor: Color
	private let action: () -> Void

	@Binding var selected: String?

	public init(selected: Binding<String?>, value: String, text: String, textColor: Color, selectedColor: Color, unselectedColor: Color, _ action: @escaping () -> Void) {
		self.text = text
		self.value = value
		self.textColor = textColor
		self._selected = selected
		self.selectedColor = selectedColor
		self.unselectedColor = unselectedColor
		self.action = action
	}
	
    public var body: some View {
		Button(action: action) {
			Text(text)
				.font(selected == value ? .system(size: 12, weight: .bold) : .system(size: 12, weight: .regular))
				.foregroundColor(textColor)
				.padding(.horizontal, 10)
				.padding(.vertical, 6)
				.background(
					Capsule()
						.foregroundColor(selected == value ? selectedColor : unselectedColor)
				)

		}
    }
}

struct CapsuleTextButton_Previews: PreviewProvider {
    static var previews: some View {
		CapsuleTextButton(selected: .constant(""), value: "", text: "", textColor: .white, selectedColor: .blue, unselectedColor: .gray, {})
    }
}
