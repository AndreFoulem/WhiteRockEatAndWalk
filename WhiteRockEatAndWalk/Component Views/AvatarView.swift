//
//  AvatarView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-21.
//

import SwiftUI

struct AvatarView: View {
  
  var image: UIImage
  var size: CGFloat = 35
  
  var body: some View {
    Image(uiImage: image)
      .resizable()
      .scaledToFit()
      .frame(width: size, height: size)
      .clipShape(Circle())
  }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
      AvatarView(image: PlaceHolderImage.avatarImg!, size: 45)
    }
}
