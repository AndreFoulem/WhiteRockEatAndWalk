//
//  LocationMapView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-20.
//

import SwiftUI
import MapKit
//49.01759629532258, -122.80570195269159
struct MapView: View {
    @State private var westBeach = MKCoordinateRegion(
      center: CLLocationCoordinate2D(latitude: 49.0230, longitude: -122.8087),
      span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
    
    @State private var eastBeach = MKCoordinateRegion(
      center: CLLocationCoordinate2D(latitude: 49.0160, longitude: -122.7895),
      span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
  
    var body: some View {
      ZStack {
        
        Map(coordinateRegion: $westBeach)
          .ignoresSafeArea()
        
        VStack {
          Image("ddg-map-logo")
            .resizable()
            .scaledToFit()
          .frame(height: 70)
          Spacer()
        }
        
      }//zs
      
    }//body
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
