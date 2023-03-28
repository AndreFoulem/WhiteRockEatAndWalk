//
//  PhotoPicker.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-27.
//

import SwiftUI
import UIKit

struct PhotoPickerDelegate: UIViewControllerRepresentable {
  typealias UIViewControllerType = UIImagePickerController

  func makeUIViewController(context: Context) -> UIImagePickerController {
    let picker = UIImagePickerController()
    return picker
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    <#code#>
  }
  
}
