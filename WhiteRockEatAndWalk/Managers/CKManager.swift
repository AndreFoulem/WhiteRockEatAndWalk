//
//  CKManager.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-22.
//

import CloudKit

struct CKManager {
  
  static func getLocations(completed: @escaping (Result<[WRLocation], Error) -> Void {
    let query = CKQuery(recordType: RecordType.location, predicate: NSPredicate(value: true))
  }
}
