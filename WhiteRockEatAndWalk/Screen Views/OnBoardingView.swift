import SwiftUI

struct OnBoardingView: View {
  
  var body: some View {
    
    VStack {
      HStack {
        Spacer()
        Button {
          
        } label: {
          DismissLabelForButton()
        }
      }
      LogoView(frameWidth: 250)
        .padding(.bottom, 24)
      descriptionCells
        .padding(.trailing, 32)
        .padding(.leading, 24)
    }
}}

//
//-> EXTENDED VIEWS AS STRUCT + VAR
//
extension OnBoardingView {
  
  private var descriptionCells: some View {
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
  }
  
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
    }//body
  }
}//ext

//
//-> Preview
//
struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
