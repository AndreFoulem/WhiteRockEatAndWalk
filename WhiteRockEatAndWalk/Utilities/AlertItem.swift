//
//  AlertItem.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-24.
//

import SwiftUI

struct AlertItem: Identifiable {
  let id = UUID()
  let title: Text
  let message: Text
  let dismissBtn: Alert.Button
}

struct AlertContext {
  
  //MARK: - MapView Errors
  static let unableToGetLocations = AlertItem(title: Text("Locations Error"),
                                              message: Text("Unable to get location"),
                                              dismissBtn: .default(Text("OK")))

  static let deviceLocationRestricted = AlertItem(title: Text("Locations restricted"),
                                              message: Text("You're location is restricted. May be due to parental controls"),
                                              dismissBtn: .default(Text("OK")))

  static let deviceLocationDenied = AlertItem(title: Text("Location access denied"),
                                              message: Text("We do not have access to your location. To enable location access go to Settings > WhiteRockEatAndWalk"),
                                              dismissBtn: .default(Text("OK")))
  
  static let deviceLocationDisabled = AlertItem(title: Text("Location access disabled"),
                                              message: Text("Your phone location services is enabled. To enable location access go to Settings > Privacy > Location Services"),
                                              dismissBtn: .default(Text("OK")))
}

