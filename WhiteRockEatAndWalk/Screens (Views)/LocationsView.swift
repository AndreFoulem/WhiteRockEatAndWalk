//
//  LocationListView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-20.
//

import SwiftUI
//! import LocationCellView

struct LocationsView: View {
    var body: some View {
      NavigationView {
        List {
          ForEach(0..<10) { _ in
            
            NavigationLink(destination: LocationDetailView()) {
              LocationCellView()
            }//hs
          }
        }
        .navigationTitle("Ice Cream")
      }//nv
      
    }//body
}

//
// PREVIEW
//
struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}



