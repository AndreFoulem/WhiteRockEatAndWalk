//
//  LoadingView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-04-08.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
      ZStack {
        Color.mint
          .opacity(0.5)
          .ignoresSafeArea()
        
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle(tint: .white))
          .scaleEffect(3)
          .offset(y: -40)
      }
      
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
