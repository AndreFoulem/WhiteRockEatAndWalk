//
//  View+.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-21.
//

import SwiftUI

extension View {
  func profileTextField(mystyle: Font) -> some View {
    return self.modifier(ProfileTextField(mystyle: mystyle))
  }
}


extension View {
  func dismissKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}

