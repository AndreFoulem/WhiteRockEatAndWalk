//
//  UIImage+toCKAsset.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-28.
//

import UIKit; import CloudKit

extension UIImage {
  func convertToCKAsset() -> CKAsset? {
    //: 1 Get our apps base document directory url
    guard let urlPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
    
    //: 2 Append some unique identifier for our profile image
    let fileUrl = urlPath.appending(components: "selectedAvatarImage")
    
    //: 3 Write image data to the location address points to
    guard let imageData = jpegData(compressionQuality: 0.7) else { return nil }
    
    //: 4 Create our CKAsset with our CKAssets
    
    return nil
  }
}
