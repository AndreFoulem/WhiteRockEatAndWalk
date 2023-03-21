//
//  LocationDetailView.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-20.
//

import SwiftUI

struct LocationDetailView: View {
    var body: some View {
        NavigationView {
          
          VStack {
            Image("default-banner-asset")
              .resizable()
              .scaledToFill()
              .frame(height: 150)
            
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
              .padding(.horizontal)
              
            Spacer()
          }
          .navigationTitle("name")
          .navigationBarTitleDisplayMode(.inline)
        }//vs
     
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView()
    }
}
