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
        LogoView(frameWidth: 250)
        HStack {
          Image(systemName: "building.2.crop.circle")
            .resizable()
            .frame(width: 50, height: 50)
            .foregroundColor(.accentColor)
          VStack {
            Text("Restaurants Locations").bold()
            Text("Find Ice Cream and Fish & Chips places at White Rock boardwalk.")
              .foregroundColor(.secondary)
              .lineLimit(2)
              .minimumScaleFactor(0.7)
          }
        }
      }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
