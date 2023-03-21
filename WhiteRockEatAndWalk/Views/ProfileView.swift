//
//  ProfileView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-20.
//

import SwiftUI

struct ProfileView: View {
  
    var body: some View {
      
      VStack {
        
        HStack {
          Text("Profile")
            .font(.title)
            .bold()
          .padding(.trailing)
          Spacer()
        }

          ZStack {
            Color(.secondarySystemBackground)
              .frame(height: 130)
              .cornerRadius(12)
            
            HStack {
              ZStack {
                AvatarView(size: 84)
                Image(systemName: "pencil")
                  .foregroundColor(.white)
              }
            }
          }//zs
          Spacer()
          
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
