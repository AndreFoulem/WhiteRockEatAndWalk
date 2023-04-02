//
//  ProfileVM.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-29.
//

import Foundation
import CloudKit

final class ProfileVM: ObservableObject {
  @Published var firstName = ""
  @Published var lastName = ""
  @Published var companyName = ""
  @Published var biography = ""
  @Published var avatar = PlaceHolderImage.avatarImg!
  @Published var isShowingPhotoPicker = false
  @Published var alertItem: AlertItem?
  
  func isValidProfile() -> Bool {
    guard !firstName.isEmpty,
          !lastName.isEmpty,
          !companyName.isEmpty,
          !biography.isEmpty,
          avatar != PlaceHolderImage.avatarImg,
          biography.count <= 100 else { return false }
    return true
  }
  
  func createProfile() {
    guard isValidProfile() else {
      alertItem = AlertContext.invalidProfile
      return
    }
    
    let profileRecord = createProfileRecord()
    
    guard let userRecord = CKManager.shared.userRecord else { return }
    
      // Create References on UserRecord to the EAWProfile we created
    userRecord["userProfile"] = CKRecord.Reference(recordID: profileRecord.recordID, action: .none)
    
 
 
    
  }//createProfile
  
  func getProfile() {
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
          // get the reference
        let profileReference = userRecord["userProfile"] as! CKRecord.Reference
        let profileRecordID = profileReference.recordID
        
        CKContainer.default().publicCloudDatabase.fetch(withRecordID: profileRecordID) { profileRecord, error in
          guard let profileRecord, error == nil else {
            print(error!.localizedDescription)
            return }
          DispatchQueue.main.async { [self] in
            let profile = EAWProfile(record: profileRecord)
            firstName = profile.firstName
            lastName = profile.lastName
            companyName = profile.company
            biography = profile.bio
            avatar = profile.avatarImage
          }
        }
      }
    }//mainCKContainer
  }//getProfile
  
  private func createProfileRecord() -> CKRecord {
      // Create our CKRecord from the profile view
    let profileRecord = CKRecord(recordType: "EAWProfile")
    profileRecord[EAWProfile.kFirstName] = firstName
    profileRecord[EAWProfile.kLastName] = lastName
    profileRecord[EAWProfile.kBio] = biography
    profileRecord[EAWProfile.kCompany] = companyName
    profileRecord[EAWProfile.kAvatar] = avatar.convertToCKAsset()
    
    return profileRecord
  }
}
