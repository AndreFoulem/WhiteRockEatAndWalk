//
//  CKManager.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-22.
//

import CloudKit

struct CKManager {
  
  static func fetchLocations(completed: @escaping (Result<[EAWLocation], Error>) -> Void) {
    let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
    let query = CKQuery(recordType: RecordType.location, predicate: NSPredicate(value: true))
    query.sortDescriptors = [sortDescriptor]
    
//    CKContainer.default().publicCloudDatabase.fetch(withQuery: query) { records, error in
//      guard error == nil else {
//        completed(.failure(error!))
//        return
//      }
//
//      guard let records = records else { return }
//
//      var locations: [WRLocation] = []
//
//      for record in records {
//        let location = WRLocation(record: record)
//        locations.append(location)
//      }
//
//      completed(.success(locations))
//    }
    
    
    CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
      guard error == nil else {
        completed(.failure(error!))
        return
      }

      guard let records = records else { return }

      var locations: [EAWLocation] = []

      for record in records {
        let location = EAWLocation(record: record)
        locations.append(location)
      }

      completed(.success(locations))
    }
    
  }
}
