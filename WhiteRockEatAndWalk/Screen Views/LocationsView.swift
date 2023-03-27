//
//  LocationListView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-20.
//

import SwiftUI
//! import LocationCellView

struct LocationsView: View {

  @EnvironmentObject private var locationManager: LocationManager
  
  var body: some View {
      NavigationView {
        List {
          ForEach(locationManager.locations,id: \.ckRecordID) { location in
            NavigationLink(destination: LocationDetailView(location: location)) {
              LocationCellView(location: location)
            }//hs
          }
        }
        .navigationTitle("Locations")
   
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



