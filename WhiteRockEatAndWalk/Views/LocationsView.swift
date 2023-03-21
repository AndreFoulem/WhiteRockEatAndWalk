//
//  LocationListView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-20.
//

import SwiftUI

struct LocationsView: View {
    var body: some View {
      NavigationView {
        List {
          ForEach(0..<10) { _ in
            LocationCellView()//hs
           
          }
        }
        .navigationTitle("Ice Cream")
      }//nv
      
    }//body
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}

//struct AvatarView: View {
//  var body: some View {
//    Image("default-avatar")
//      .resizable()
//      .scaledToFit()
//      .frame(width: 35, height: 35)
//      .clipShape(Circle())
//  }
//}

struct LocationCellView: View {
  
  var body: some View {
    HStack {
      Image("default-square-asset")
        .resizable()
        .scaledToFit()
        .frame(height: 80)
        .clipShape(Circle())
        .padding(.vertical, 8)
      
      VStack(alignment: .leading) {
        Text("item")
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
