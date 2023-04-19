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

  //MARK: - ProfileView Errors
  static let invalidProfile = AlertItem(title: Text("Invalid Profile"),
                                              message: Text("All text fields needt to be filled up. A default avatar image should be chosen"),
                                              dismissBtn: .default(Text("OK")))
  
  static let noUserRecord = AlertItem(title: Text("No User Profile"),
                                              message: Text("You must log in on your phone in order to utilize"),
                                              dismissBtn: .default(Text("OK")))
  
  static let createProfileSuccess = AlertItem(title: Text("Profile Created"),
                                              message: Text(""),
                                              dismissBtn: .default(Text("OK")))
  
  static let createProfileFailure = AlertItem(title: Text("Failed to create profile"),
                                      message: Text("We were not able to create a profile at this time. Please try again later or contact customer support"),
                                      dismissBtn: .default(Text("OK")))
  
  static let unableToRetrieveProfile = AlertItem(title: Text("Unable to retrieve profile"),
                                      message: Text("We were not able to retrieve profile at this time. Please try again later or contact customer support"),
                                      dismissBtn:
      .default(Text("OK")))
  
  static let updateProfileSucess = AlertItem(title: Text("Profile update success!"),
                                      message: Text("Your Profile was updated successfully"),
                                      dismissBtn: .default(Text("OK")))
  
  static let updateProfileFailure = AlertItem(title: Text("Unable to update your profile profile"),
                                      message: Text("We were not able to retrieve profile at this time. Please try again later or contact customer support"),
                                      dismissBtn: .default(Text("OK")))
}
