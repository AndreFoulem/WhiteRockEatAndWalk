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
        Color(.systemBackground)
          .opacity(0.9)
          .ignoresSafeArea()
        
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle(tint: .mint))
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
