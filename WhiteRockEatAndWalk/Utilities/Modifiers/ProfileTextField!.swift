//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-21.
//

import SwiftUI

//! this modifier is extended in View+
struct ProfileTextField: ViewModifier {
  var mystyle: Font
  
  func body(content: Content) -> some View {
    return content
      .font(mystyle)
      .bold()
      .minimumScaleFactor(0.7)
      .lineLimit(1)
  }
}


