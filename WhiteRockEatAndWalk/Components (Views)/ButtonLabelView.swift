//
//  ButtonLabel.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-22.
//

import SwiftUI

struct ButtonLabel: View {
    var label: String
    var bgColor: Color = Color.brandPrimary
    var width: CGFloat = 280
    var height: CGFloat = 44
  
    var body: some View {
      Text(label)
        .bold()
        .frame(width: width, height: height)
        .foregroundColor(.white)
        .background(bgColor)
        .cornerRadius(8)
    }
}

struct ButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabel(label: "my title")
    }
}
