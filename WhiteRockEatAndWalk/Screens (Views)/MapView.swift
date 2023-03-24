//
//  LocationMapView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-20.
//

import SwiftUI
import MapKit

struct MapView: View {
  
  @StateObject private var vm = MapVM()

    var body: some View {
      ZStack {
        
        Map(coordinateRegion: $vm.westBeach).ignoresSafeArea()
        
        VStack {
          LogoView()
          Spacer()
        }
        
      }//zs
      .alert(item: $vm.alertItem, content: { alertItem in
        Alert(title: alertItem.title,
              message: alertItem.message,
              dismissButton: alertItem.dismissBtn
        )
      })
      .onAppear {
        vm.fetchLocations()
      }
      
    }//body
}

//
// Local Components Views
//
struct LogoView: View {
  var body: some View {
    Image("ddg-map-logo")
      .resizable()
      .scaledToFit()
      .frame(height: 70)
  }
}

//
// PREVIEW
//
struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
