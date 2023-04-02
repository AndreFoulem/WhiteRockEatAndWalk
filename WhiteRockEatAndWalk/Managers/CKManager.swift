//
//  CKManager.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-22.
//

import CloudKit

final class CKManager {
  
  static let shared = CKManager()
  
  func fetchLocations(completed: @escaping (Result<[EAWLocation], Error>) -> Void) {
    
    // Init NSSortDescriptor
    let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
    // Init CKQuery
    let query = CKQuery(recordType: "EAWLocation", predicate: NSPredicate(value: true))
    // Add NSSortDescriptor to CKQuery
    query.sortDescriptors = [sortDescriptor]
    
//    -> NON ASYNC/AWAIT with Completion :: Fetch with CKQuery
    CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
      
      // Handle error
      guard error == nil else {
        completed(.failure(error!))
        return
      }

      // Do we have records?
      guard let records = records else { return }

      
      let locations = records.map { $0.convertToEAWLocation() }

      // Completed ** like return locations
      completed(.success(locations))
    }

  }
}
