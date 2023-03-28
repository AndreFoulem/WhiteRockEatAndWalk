//
//  LocationFirstNameView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-21.
//

import SwiftUI
//! import AvatarView

struct FirstNameAvatarView: View {
  
  var firstName: String
  
  var body: some View {
    VStack {
      AvatarView(image: PlaceHolderImage.avatarImg!,size: 64)
      Text(firstName)
        .bold()
        .lineLimit(1)
        .minimumScaleFactor(0.70)
    }
  }
}

struct FirstNameAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        FirstNameAvatarView(firstName: "John")
    }
}
