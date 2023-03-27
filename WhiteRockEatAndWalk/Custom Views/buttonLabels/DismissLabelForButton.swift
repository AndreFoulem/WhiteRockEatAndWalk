//
//  DismissLabelForButton.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-27.
//

import SwiftUI

struct DismissLabelForButton: View {
    var body: some View {
      ZStack {
        Circle()
          .frame(width:30, height:30)
          .foregroundColor(.accentColor)
        Image(systemName: "xmark")
          .foregroundColor(.white)
          .imageScale(.small)
          //-> Target area
          .frame(width: 60, height: 60)
      }
    }
}

struct DismissLabelForButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissLabelForButton()
    }
}
