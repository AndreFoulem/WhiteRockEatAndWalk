//
//  MapVM.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-24.
//

import MapKit

final class MapVM: ObservableObject {
  @Published var alertItem: AlertItem?
  
  @Published var westBeach = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 49.0230, longitude: -122.8087),
    span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
  
  @Published var eastBeach = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 49.0160, longitude: -122.7895),
    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
  
  @Published var locations: [EAWLocation] = []
  
  func fetchLocations() {
    CKManager.fetchLocations { [self] result in
          switch result {
            case .success(let locations):
              self.locations = locations
            case .failure(_):
              alertItem = AlertContext.unableToGetLocations
          }
        }
  }
}
