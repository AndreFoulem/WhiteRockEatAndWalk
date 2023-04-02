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
    
    CKManager.shared.batchSave(records: [userRecord, profileRecord]) { result in
      switch result {
        case .success(_):
            // show alert
          break
        case .failure(_):
            // success alert
          break
      }
    }
    
  }//createProfile
  
  func getProfile() {
      //-> get record or return
    guard let userRecord = CKManager.shared.userRecord else { return }
    
      // get the reference
    guard let profileReference = userRecord["userProfile"] as? CKRecord.Reference else {
      return
    }
    
    let profileRecordID = profileReference.recordID
    
    CKManager.shared.fetchRecord(with: profileRecordID) { result in
      DispatchQueue.main.async { [self] in
        switch result {
          case .success(let record):
            let profile = EAWProfile(record: record)
            firstName = profile.firstName
            lastName = profile.lastName
            companyName = profile.company
            biography = profile.bio
            avatar = profile.avatarImage
          case .failure(_):
              // show alert
            break
        }
      }
    }
    
    
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
