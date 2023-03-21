//
//  ProfileView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-20.
//

import SwiftUI

struct ProfileView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var companyName = ""
    @State private var biography = ""
    
    var body: some View {
      
      //: Container
      VStack {
        
        //: Title
        HStack {
          Text("Profile")
            .font(.title)
            .foregroundColor(.primary)
            .bold()
          .padding(.trailing)
          Spacer()
        }

        //: Profile banner
        ZStack {
            Color(.secondarySystemBackground)
              .frame(height: 130)
              .cornerRadius(12)
            
            HStack(spacing: 16) {
              ZStack {
                AvatarView(size: 84)
                Image(systemName: "pencil.circle.fill")
                  .font(.title)
                  .foregroundColor(.black)
                  .opacity(0.7)
                  .offset(x: 30, y: 30)
              }
         
              VStack(spacing: 0) {
                TextField("First Name", text: $firstName)
                  .font(.title)
                  .bold()
                  .minimumScaleFactor(0.7)
                  .lineLimit(1)
                
                TextField("Last Name", text: $lastName)
                  .font(.title)
                  .bold()
                  .minimumScaleFactor(0.7)
                  .lineLimit(1)
                
                TextField("Company Name", text: $companyName)
                  .font(.body)
                  .bold()
                  .minimumScaleFactor(0.7)
                  .lineLimit(1)
              }
              
            }//hs
            .padding(.horizontal)
            
          }//zs
        
        //: Bio description
        VStack(alignment: .leading) {
          Text("Bio: ")
            .foregroundColor(.secondary)
          +
          Text("\(100 - biography.count)")
            .foregroundColor(biography.count <= 100 ? .brandPrimary : .pink)
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
        
        Spacer()
        
        Button {
          
        } label: {
          Text("Save Profile")
            .bold()
            .frame(width: 280, height: 44)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(8)
        }
   
          
      }//vs
      .padding(.horizontal)
//      .navigationTitle("Profile")
      
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
