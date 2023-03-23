//
//  MyMockData.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-22.
//

import CloudKit

struct MockLocation {
  
  static var location: CKRecord {
    let record = CKRecord(recordType: RecordType.location)
    record[EAWLocation.kName] = "Adres best ice cream"
    record[EAWLocation.kAddress] = "123 amin street"
    record[EAWLocation.kDescription] = "this is my descriptiointhis is my descriptiointhis is my descriptioin"
    record[EAWLocation.kWebsite] = "www.google.ca"
    record[EAWLocation.kLocation] = CLLocation(latitude: 49.019380, longitude: -122.791546)
    record[EAWLocation.kPhone] = "12223334444"
    
    return record
  }
  
}
