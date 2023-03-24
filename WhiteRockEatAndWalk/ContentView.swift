//
//  ContentView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-20.
//

import SwiftUI

struct ContentView: View {
  
    let locationManager = LocationManager()
  
    var body: some View {
      
      ZStack {
          AppTabView()
          .environmentObject(locationManager)
      }
      
    }//body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
