//
//  ProfileView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-20.
//

import SwiftUI
import CloudKit
//! import AvatarView

struct ProfileView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var companyName = ""
    @State private var biography = ""
    @State private var avatar = PlaceHolderImage.avatarImg!
    @State private var isShowingPhotoPicker = false
    @State private var alertItem: AlertItem?
    
    var body: some View {
      
      //: Container
      VStack {
        profileTitle

        profileBanner
        
        profileBio
        Spacer()
        saveButton
      }
      .padding(.horizontal)
      .toolbar {
        Button {
          dismissKeyboard()
        } label: {
          Image(systemName: "person")
        }
      }
      .alert(item: $alertItem, content: { alertItem in
        Alert(title: alertItem.title,
              message: alertItem.message,
              dismissButton: alertItem.dismissBtn
        )
      })
      .sheet(isPresented: $isShowingPhotoPicker) {
        PhotoPicker(image: $avatar)
      }
      .navigationTitle("Profile")
    }
}

//MARK: functions
extension ProfileView {
  
  func isValidProfile() -> Bool {
    guard !firstName.isEmpty,
          !lastName.isEmpty,
          !companyName.isEmpty,
          !biography.isEmpty,
          avatar != PlaceHolderImage.avatarImg,
          biography.count < 100 else { return false }
    return true
  }
  
  func createProfile() {
    guard isValidProfile() else {
      alertItem = AlertContext.invalidProfile
      return
    }
    
    // Create our CKRecord from the profile view
    let profileRecord = CKRecord(recordType: "EAWProfile")
    profileRecord[EAWProfile.kFirstName] = firstName
    profileRecord[EAWProfile.kLastName] = lastName
    profileRecord[EAWProfile.kBio] = biography
    profileRecord[EAWProfile.kCompany] = companyName
    profileRecord[EAWProfile.kAvatar] = avatar.convertToCKAsset()
    
    // Get our userRecordID from the Container
    
    // Get UserRecord from the Public Database
    
    // Create References on UserRecord to the EAWProfile we created
    
    // Create CKOperation to save batch entry
  }
}

//MARK: views
extension ProfileView {
  private var profileTitle: some View {
    HStack {
      Text("Profile")
        .font(.title)
        .foregroundColor(.primary)
        .bold()
        .padding(.trailing)
      Spacer()
    }
  }
  
  private var profileBanner: some View {
    ZStack {
      Color(.secondarySystemBackground)
        .frame(height: 130)
        .cornerRadius(12)
      
      HStack(spacing: 16) {
        ZStack {
          AvatarView(image: avatar,size: 84)
            .onTapGesture {
              isShowingPhotoPicker = true
            }
          Image(systemName: "pencil.circle.fill")
            .font(.title)
            .foregroundColor(.black)
            .opacity(0.7)
            .offset(x: 30, y: 30)
        }
        
        VStack(spacing: 0) {
          TextField("First Name", text: $firstName)
            .profileTextField(mystyle: .title)
          
          TextField("Last Name", text: $lastName)
            .profileTextField(mystyle: .title)
          
          TextField("Company Name", text: $companyName)
            .profileTextField(mystyle: .title3)
        }
        
      }//hs
      .padding(.horizontal)
      
    }//zs
  }
  
  private var profileBio: some View {
    VStack(alignment: .leading) {
      Text("Bio: ")
        .foregroundColor(.secondary)
      +
      Text("\(100 - biography.count)")
        .foregroundColor(biography.count <= 100 ? .primary : .pink)
        .fontWeight(.black)
      +
      Text(" Characters of less")
        .foregroundColor(.secondary)
      
      TextEditor(text: $biography)
        .frame(height: 100)
        .overlay(
          RoundedRectangle(cornerRadius: 8)
            .stroke(.secondary, lineWidth: 1)
        )
        .padding(.vertical, -8)
    }
    .padding(.vertical)
  }
  
  private var saveButton: some View {
    Button {
      createProfile()
    } label: {
       ButtonLabel(label: "Save")
    }
    .padding(.bottom)
  }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
