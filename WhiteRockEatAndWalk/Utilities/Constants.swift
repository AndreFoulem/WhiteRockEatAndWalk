//
//  Constants.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-22.
//

import UIKit

enum RecordType {
  static let location = "EAWLocation"
  static let profile = "EAWProfile"
}

enum PlaceHolderImage {
  static let avatarImg = UIImage(named: "default-avatar")
  static let squareImg = UIImage(named: "default-square-asset")
  static let bannerImg = UIImage(named: "default-banner-asset")
}

enum ImageDimension {
  case square, banner
  
  static func getPlaceHolderUIImage(for dimension: ImageDimension) -> UIImage {
    switch dimension {
      case .square:
        return PlaceHolderImage.squareImg!
      case .banner:
        return PlaceHolderImage.bannerImg!
    }
  }
}
