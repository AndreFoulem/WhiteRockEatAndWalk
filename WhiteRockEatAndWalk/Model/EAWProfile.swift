//
//  EAWProfile.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-22.
//

import Foundation

import CloudKit
import UIKit

struct EAWProfile {
  
  static let kFirstName = "firstName"
  static let kLastName = "lastName"
  static let kAvatar = "avatar"
  static let kCompany = "company"
  static let kBio = "bio"
  static let kHasReviewed = "hasReviewed"

  
  let ckRecordID: CKRecord.ID
  let firstName: String
  let lastName: String
  let avatar: CKAsset!
  let company: String
  let bio: String
  let hasReviewed: CKRecord.Reference? = nil
}

extension EAWProfile {
  init(record: CKRecord) {
    ckRecordID = record.recordID
    firstName = record[Self.kFirstName] as? String ?? "N/A"
    lastName = record[Self.kLastName] as? String ?? "N/A"
    avatar = record[Self.kAvatar] as? CKAsset
    company = record[Self.kCompany] as? String ?? "N/A"
    bio = record[Self.kBio] as? String ?? "N/A"
  }
  
  var avatarImage: UIImage {
    guard let avatar else { return PlaceHolderImage.avatarImg! }
    return avatar.convertToUIImage(in: .banner)
  }
  
//  var bannerImg: UIImage {
//    guard let  else { return PlaceHolderImage.bannerImg! }
//    return asset.convertToUIImage(in: .banner)
//  }
}
