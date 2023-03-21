//
//  LocationDetailView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-20.
//

import SwiftUI

struct LocationDetailView: View {
  
    var body: some View {
      
      VStack {
        Image("default-banner-asset")
          .resizable()
          .scaledToFill()
          .frame(height: 150)
        
          //-> sub banner image Container
        VStack {
          HStack {
            Label("123 Main Street", systemImage: "mappin.and.ellipse")
              .font(.caption)
              .underline()
              .foregroundColor(.gray)
            
            Image(systemName:"arrowshape.turn.up.backward.circle.fill")
              .foregroundColor(.brandPrimary)
          }
          .padding(.vertical, 2)
          
          Text("This is a description of a description of a restaurant it is the best place of the world  description of a description of a restaurant it is the best place of the world")
            .lineLimit(3)
            .minimumScaleFactor(0.70)
          
          
          ZStack {
            Capsule()
              .frame(height: 80)
              .foregroundColor(.secondary)
            
              //-> circle btns
            HStack(spacing: 16.0) {
              Button {
                
              } label: { LocationActionButton(bgColor: .brandPrimary, fillColor: .white, imageName: "location.fill")
              }
              
              Link(destination: URL(string: "https://www.apple.com")!, label: {
                LocationActionButton(bgColor: .brandPrimary, fillColor: .white, imageName: "network")
              })
              
              Button {
                
              } label: { LocationActionButton(bgColor: .brandPrimary, fillColor: .white, imageName: "phone.fill")
              }
              
              Button {
                
              } label: { LocationActionButton(bgColor: .brandPrimary, fillColor: .white, imageName: "person.fill.checkmark",
                                              iconHeight: 20)
              }
            }//hs
            
          }//zs
          
          
          Text("what's here")
            .bold()
          
          ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())]) {
              FirstNameAvatarView(firstName: "Ice Cream")
              FirstNameAvatarView(firstName: "Ice milk")
              FirstNameAvatarView(firstName: "Figh Chips")
              FirstNameAvatarView(firstName: "Ice Cream")
              FirstNameAvatarView(firstName: "Ice milk")
              FirstNameAvatarView(firstName: "Figh Chips")
              FirstNameAvatarView(firstName: "Ice Cream")
              FirstNameAvatarView(firstName: "Ice milk")
              FirstNameAvatarView(firstName: "Figh Chips")
              FirstNameAvatarView(firstName: "Figh Chips")
            }
          }
          
          
          Spacer()
          
        }//vs sub-banner container
        .padding(.horizontal)
        
      }//vs
      .navigationTitle("name")
      .navigationBarTitleDisplayMode(.inline)
      
    }//body
}

struct LocationDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      LocationDetailView()
    }
  }
}

struct LocationActionButton: View {
  var bgColor: Color
  var fillColor: Color
  var imageName: String
  var iconHeight: CGFloat = 22
  
  var body: some View {
    ZStack {
      Circle()
        .foregroundColor(bgColor)
        .frame(height: 60)
      Image(systemName: imageName)
        .resizable()
        .scaledToFit()
        .foregroundColor(fillColor)
        .frame(height: iconHeight)
    }
  }
}

struct FirstNameAvatarView: View {
  
  var firstName: String
  
  var body: some View {
    VStack {
      AvatarView(size: 64)
      Text(firstName)
        .bold()
        .lineLimit(1)
        .minimumScaleFactor(0.70)
    }
  }
}
