//
//  LocationDetailView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-20.
//

import SwiftUI

struct LocationDetailView: View {
    var location: EAWLocation
  
    var body: some View {
      //
      VStack {
        banner
        //-> sub banner image Container
        VStack {
          address
          description
          actionStack
          Text("what's here").bold()
          foods
          Spacer()
        }//vs
        .padding(.horizontal)
        
      }//vs
      .navigationTitle("name")
      .navigationBarTitleDisplayMode(.inline)
      
    }//body
}

  //
  // Local Variable Views
  //
extension LocationDetailView {
  
  var banner: some View {
    Image("default-banner-asset")
      .resizable()
      .scaledToFill()
      .frame(height: 150)
  }
  
  var address: some View {
    HStack {
      Label(location.address, systemImage: "mappin.and.ellipse")
        .font(.caption)
        .underline()
        .foregroundColor(.gray)
      
      Image(systemName:"arrowshape.turn.up.backward.circle.fill")
        .foregroundColor(.primary)
    }
    .padding(.vertical, 2)
  }
  
  var description: some View {
    Text(location.description)
      .lineLimit(3)
      .minimumScaleFactor(0.70)
  }
  
  var actionStack: some View {
    ZStack {
      Capsule()
        .frame(height: 80)
        .foregroundColor(.secondary)
      
        //-> circle btns
      HStack(spacing: 16.0) {
        Button {
          
        } label: { LocationActionButton(bgColor: .accentColor, fillColor: .white, imageName: "location.fill")
        }
        
        Link(destination: URL(string: location.website)!, label: {
          LocationActionButton(bgColor: .accentColor, fillColor: .white, imageName: "network")
        })
        
        Button {
          
        } label: { LocationActionButton(bgColor: .accentColor, fillColor: .white, imageName: "phone.fill")
        }
        
        Button {
          
        } label: { LocationActionButton(bgColor: .accentColor, fillColor: .white, imageName: "person.fill.checkmark",
                                        iconHeight: 20)
        }
      }//hs
      
    }//zs
  }
  
  var foods: some View {
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
  }
  
}

//
// Local Components Views
//
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

  //
  // PREVIEW
  //
struct LocationDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      LocationDetailView(location: EAWLocation(record: MockLocation.location))
    }
  }
}


