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
}

