//
//  CKManager.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-22.
//

import CloudKit

final class CKManager {
  
  static let shared = CKManager()
  
  private init() {}
  
  var userRecord: CKRecord?
  
  //-> run in background
  func fetchUserRecord() {
    CKContainer.default().fetchUserRecordID { recordID, error in
      guard let recordID,
            error == nil else {
        print(error!.localizedDescription)
        return
      }
      
      CKContainer.default().publicCloudDatabase.fetch(withRecordID: recordID) { userRecord, error in
        guard let userRecord,
              error == nil else {
          print(error!.localizedDescription)
          return
        }
        self.userRecord = userRecord
      }//ckContainer
      
    }//ckContainer
    
  }//fetchUserRecord
  
  
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
