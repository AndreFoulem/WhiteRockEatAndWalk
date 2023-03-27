//
//  OnBoardingView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-27.
//

import SwiftUI

struct OnBoardingView: View {

    var body: some View {
      VStack {
        //-> Dismiss
        HStack {
          Spacer()
          Button {
            
          } label: {
            ZStack {
              Circle()
                .frame(width:30, height:30)
                .foregroundColor(.accentColor)
              Image(systemName: "xmark")
                .foregroundColor(.white)
                .imageScale(.small)
                //-> Target area
                .frame(width: 60, height: 60)
            }
            
          }
        }
        
        LogoView(frameWidth: 250)
          .padding(.bottom, 24)
      
        VStack(alignment: .leading) {
          InfoCell( imageName: OnboardContent.SFSymbol1.rawValue,
                    title: OnboardContent.title1.rawValue,
                    description: OnboardContent.desc1.rawValue)
          
          InfoCell( imageName: OnboardContent.SFSymbol2.rawValue,
                    title: OnboardContent.title2.rawValue,
                    description: OnboardContent.desc2.rawValue)
          
          InfoCell( imageName: OnboardContent.SFSymbol3.rawValue,
                    title: OnboardContent.title3.rawValue,
                    description: OnboardContent.desc3.rawValue)
        }//vs
        .padding(.trailing, 32)
        .padding(.leading, 24)
        
      }//vs
    }//body
}


//
//-> LOCAL STRUCT COMPONENTS
//
extension OnBoardingView {
  
  struct InfoCell: View {
    
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
      HStack(spacing: 16) {
        Image(systemName: imageName)
          .resizable()
          .frame(width: 50, height: 50)
          .foregroundColor(.accentColor)
          .padding(.vertical, -38)
        VStack(alignment: .leading) {
          Text(title).bold()
            .font(.title3)
            .padding(1)
          Text(description)
            .foregroundColor(.secondary)
            .lineLimit(2)
            .minimumScaleFactor(0.7)
        }
      }
      .padding(.bottom, 12)
    }
  }//struct Description
  
}



  //
  //-> LOCAL STRUCT COMPONENTS
  //
struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
