//
//  EAWLocation.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-22.
//

import CloudKit
import UIKit

struct EAWLocation: Identifiable {
  
  let id = UUID()
  
  static let kName = "name"
  static let kDescription = "description"
  static let kAddress = "address"
  static let kWebsite = "website"
  static let kPhone = "phone"
  static let kCategory = "category"
  static let kSquareImage = "squareImage"
  static let kBannerImage = "bannerImage"
  static let kLocation = "location"
  
  let ckRecordID: CKRecord.ID
  let name: String
  let description: String
  let address: String
  let website: String
  let phone: String
  let category: String
  let squareImage: CKAsset!
  let bannerImage: CKAsset!
  let location: CLLocation

  
  init(record: CKRecord) {
    ckRecordID = record.recordID
    name = record[Self.kName] as? String ?? "N/A"
    description = record[Self.kDescription] as? String ?? "N/A"
    address = record[Self.kAddress] as? String ?? "N/A"
    website = record[Self.kWebsite] as? String ?? "N/A"
    phone = record[Self.kPhone] as? String ?? "N/A"
    category = record[Self.kCategory] as? String ?? "N/A"
    squareImage = record[Self.kSquareImage] as? CKAsset
    bannerImage = record[Self.kBannerImage] as? CKAsset
    location = record[Self.kLocation] as? CLLocation ?? CLLocation(latitude: 0, longitude: 0)
  }
  
  func createSquareImage() -> UIImage {
    guard let asset = squareImage else { return PlaceHolderImage.squareImg! }
    return asset.convertToUIImage(in: .square)
  }
  
  var bannerImg: UIImage {
    guard let asset = bannerImage else { return PlaceHolderImage.bannerImg! }
    return asset.convertToUIImage(in: .banner)
  }
  
}
