//
//  MapVM.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-24.
//

import MapKit

final class MapVM: NSObject, ObservableObject {
  //- toggle to see the updated value
  @Published var isShowingOnboardingView = false
  @Published var alertItem: AlertItem?
  
  @Published var westBeach = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 49.0230, longitude: -122.8087),
    span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
  
  @Published var eastBeach = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 49.0160, longitude: -122.7895),
    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
  
  var kHasSeenOnBoardingView = "hasSeenOnBoardingView"
  var hasSeenOnBoardingView: Bool {
    return UserDefaults.standard.bool(forKey: kHasSeenOnBoardingView)
  }
  func runStartupCheck() {
    if !hasSeenOnBoardingView {
      isShowingOnboardingView = true
      UserDefaults.standard.set(true, forKey: kHasSeenOnBoardingView)
    } else {
      checkIfLocationServicesIsEnabled()
    }
  }
  
  var deviceLocationManager: CLLocationManager?
  
  func checkIfLocationServicesIsEnabled() {
    if CLLocationManager.locationServicesEnabled() {
      // Init the CLLocationManager Instance -> Fire off the Manager Delegate method
      deviceLocationManager = CLLocationManager()
      deviceLocationManager!.delegate = self
      //-> Accuracy Best is the default
      deviceLocationManager?.desiredAccuracy = kCLLocationAccuracyBest
 
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
    CKManager.shared.fetchLocations { [self] result in
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


extension MapVM: CLLocationManagerDelegate {
    //-> Handle location services changes
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    checkAppLocationAuthorization()
  }
  
}
