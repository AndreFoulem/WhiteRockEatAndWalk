//
//  LocationListView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-20.
//

import SwiftUI
//! import LocationCellView

struct LocationsView: View {
  @State private var locations: [WRLocation] = [WRLocation(record: MockLocation.location)]
  
  
  var body: some View {
      NavigationView {
        List {
          ForEach(locations,id: \.ckRecordID) { location in
            NavigationLink(destination: LocationDetailView(location: location)) {
              LocationCellView(location: location)
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



