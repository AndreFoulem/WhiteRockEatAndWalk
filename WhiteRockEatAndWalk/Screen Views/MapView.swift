//
//  LocationMapView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-20.
//

import SwiftUI
import MapKit

struct MapView: View {
  @EnvironmentObject private var locationManager: LocationManager
  @StateObject private var vm = MapVM()

    var body: some View {
      ZStack {
        
        Map(coordinateRegion: $vm.eastBeach, showsUserLocation: true, annotationItems: locationManager.locations) { location in
          MapMarker(coordinate: location.location.coordinate, tint: .accentColor)
        }.tint(.pink).edgesIgnoringSafeArea(.top)

        VStack {
          LogoView(frameWidth: 125)
          Spacer()
        }

      }//zs
      .sheet(isPresented: $vm.isShowingOnboardingView, onDismiss: vm.checkIfLocationServicesIsEnabled) {
        OnBoardingView(isShowingOnBoardingView: $vm.isShowingOnboardingView)
      }
      .alert(item: $vm.alertItem, content: { alertItem in
        Alert(title: alertItem.title,
              message: alertItem.message,
              dismissButton: alertItem.dismissBtn
        )
      })
      .onAppear {
        vm.runStartupCheck()
        
        if locationManager.locations.isEmpty {
          vm.fetchLocations(for: locationManager)
        }
      }
      
    }//body
}


struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
