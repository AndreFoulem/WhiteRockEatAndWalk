//
//  AppTab_View.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-20.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
      TabView {
        LocationMapView()
          .tabItem {
            Label("Map", systemImage: "map")
          }
        LocationListView()
          .tabItem {
            Label("Location", systemImage: "building")
          }
        ProfileView()
          .tabItem {
            Label("Profile", systemImage: "person")
          }
      }.accentColor(.brandPrimary)
    }
  
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
