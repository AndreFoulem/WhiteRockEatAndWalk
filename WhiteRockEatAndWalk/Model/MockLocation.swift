//
//  MyMockData.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-22.
//

import CloudKit

struct MockLocation {
  
  static var location: CKRecord {
    let record = CKRecord(recordType: "WRLocation")
    record[WRLocation.kName] = "Adres best ice cream"
    record[WRLocation.kAddress] = "123 amin street"
    record[WRLocation.kDescription] = "this is my descriptiointhis is my descriptiointhis is my descriptioin"
    record[WRLocation.kWebsite] = "www.google.ca"
    record[WRLocation.kLocation] = CLLocation(latitude: 49.019380, longitude: -122.791546)
    record[WRLocation.kPhone] = "12223334444"
    
    return record
  }
  
}
