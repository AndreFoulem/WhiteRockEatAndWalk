//
//  CKAsset+.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-25.
//

import UIKit
import CloudKit

extension CKAsset {
  func convertToUIImage(in dimension: ImageDimension) -> UIImage {
    let placeholder = ImageDimension.getPlaceHolderUIImage(for: dimension)
    
    guard let isURL = self.fileURL else { return placeholder }
    
    do {
      let data = try Data(contentsOf: isURL)
      return UIImage(data: data) ?? placeholder
      
    } catch {
      return placeholder
    }
  }
}

