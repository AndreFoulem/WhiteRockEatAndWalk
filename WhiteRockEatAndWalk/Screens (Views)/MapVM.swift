//
//  MapVM.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-24.
//

import MapKit

final class MapVM: ObservableObject, NSObject {
  @Published var alertItem: AlertItem?
  
  @Published var westBeach = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 49.0230, longitude: -122.8087),
    span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
  
  @Published var eastBeach = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 49.0160, longitude: -122.7895),
    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
  
  var deviceLocationManager: CLLocationManager?
  
  func checkIfLocationServicesIsEnabled() {
    if CLLocationManager.locationServicesEnabled() {
      deviceLocationManager = CLLocationManager()
      //-> Accuracy Best is the default
      deviceLocationManager?.desiredAccuracy = kCLLocationAccuracyBest
      
      checkAppLocationAuthorization()
    } else {
      alertItem = AlertContext.deviceLocationDisabled
    }
  }
  
  private func checkAppLocationAuthorization() {
    guard let deviceLocationManager else { return }
    
    switch deviceLocationManager.authorizationStatus {
      case .notDetermined:
        deviceLocationManager.requestWhenInUseAuthorization()
      case .restricted:
        alertItem = AlertContext.deviceLocationRestricted
      case .denied:
        alertItem = AlertContext.deviceLocationDenied
      case .authorizedAlways, .authorizedWhenInUse:
        break
      @unknown default:
        break
    }
    
  }
  
  func fetchLocations(for locationManager: LocationManager) {
    CKManager.fetchLocations { [self] result in
      DispatchQueue.main.async {
        switch result {
          case .success(let locations):
            locationManager.locations = locations
          case .failure(_):
            self.alertItem = AlertContext.unableToGetLocations
        }
      }
    }
  }
}


extension MapVM {
    //-> Handle location services changes
  
}
