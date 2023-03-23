//
//  LocationCellView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-21.
//

import SwiftUI
//! import AvatarView

struct LocationCellView: View {
  
  var location: EAWLocation
  
  var body: some View {
    HStack {
      Image("default-square-asset")
        .resizable()
        .scaledToFit()
        .frame(height: 80)
        .clipShape(Circle())
        .padding(.vertical, 8)
      
      VStack(alignment: .leading) {
        Text(location.name)
          .font(.title3)
          .fontWeight(.semibold)
        
        HStack {
          AvatarView()
          AvatarView()
          AvatarView()
          AvatarView()
          AvatarView()
        }
      }
      .padding(.leading,4)
    }
  }
}

struct LocationCellView_Previews: PreviewProvider {
    static var previews: some View {
      LocationCellView(location: EAWLocation(record: MockLocation.location))
    }
}
