//
//  LocationManager.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-24.
//

import Foundation

final class LocationManager: ObservableObject {
  @Published var locations: [EAWLocation] = []
}
