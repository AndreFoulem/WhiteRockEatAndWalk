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
  @StateObject private var vm = ProfileVM()
    
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
      .onAppear {
        vm.getProfile()
      }
      .alert(item: $vm.alertItem, content: { alertItem in
        Alert(title: alertItem.title,
              message: alertItem.message,
              dismissButton: alertItem.dismissBtn
        )
      })
      .sheet(isPresented: $vm.isShowingPhotoPicker) {
        PhotoPicker(image: $vm.avatar)
      }
      .navigationTitle("Profile")
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
          AvatarView(image: vm.avatar,size: 84)
            .onTapGesture {
              vm.isShowingPhotoPicker = true
            }
          Image(systemName: "pencil.circle.fill")
            .font(.title)
            .foregroundColor(.black)
            .opacity(0.7)
            .offset(x: 30, y: 30)
        }
        
        VStack(spacing: 0) {
          TextField("First Name", text: $vm.firstName).profileTextField(mystyle: .title)
          TextField("Last Name", text: $vm.lastName).profileTextField(mystyle: .title)
          TextField("Company Name", text: $vm.companyName).profileTextField(mystyle: .title3)
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
      Text("\(100 - vm.biography.count)")
        .foregroundColor(vm.biography.count <= 100 ? .primary : .pink)
        .fontWeight(.black)
      +
      Text(" Characters of less")
        .foregroundColor(.secondary)
      
      TextEditor(text: $vm.biography)
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
//      createProfile()
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
