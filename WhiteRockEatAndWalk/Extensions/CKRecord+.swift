//
//  CKRecord+.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-24.
//

import CloudKit

//* We are feeding the CKRecord to init the EAWProfile Data Object Model
extension CKRecord {
  
  func convertToEAWLocation() -> EAWLocation {
    EAWLocation(record: self)
  }
  
  func convertToEAWProfile() -> EAWProfile {
    EAWProfile(record: self)
  }
}
