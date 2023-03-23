//
//  CKManager.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-22.
//

import CloudKit

struct CKManager {
  
  static func fetchLocations(completed: @escaping (Result<[WRLocation], Error>) -> Void) {
    let sortDescriptor = NSSortDescriptor(key: WRLocation.kName, ascending: true)
    let query = CKQuery(recordType: RecordType.location, predicate: NSPredicate(value: true))
    query.sortDescriptors = [sortDescriptor]
    
    CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
      guard error == nil else {
        completed(.failure(error!))
        return
      }
      
      guard let records = records else { return }
      
      var locations: [WRLocation] = []
      for record in records {
        let location = WRLocation(record: record)
        locations.append(location)
      }
      
      completed(.success(locations))
    }
    
  }
}
