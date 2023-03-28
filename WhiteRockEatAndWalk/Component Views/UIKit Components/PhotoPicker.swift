//
//  PhotoPicker.swift
//  WhiteRockEatAndWalk
//
//  Created by AndreMacBook on 2023-03-27.
//

import SwiftUI
import UIKit

struct PhotoPicker: UIViewControllerRepresentable {
  typealias UIViewControllerType = UIImagePickerController
  
  @Binding var image: UIImage

  func makeUIViewController(context: Context) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    picker.allowsEditing = true
    return picker
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
  }
  

  func makeCoordinator() -> CoordinatorDelegate {
    CoordinatorDelegate(photoPicker: self)
  }
}

  // // DELEGATE ////
final class CoordinatorDelegate: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  
  let photoPicker: PhotoPicker
  
  init(photoPicker: PhotoPicker) {
    self.photoPicker = photoPicker
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[.editedImage] as? UIImage {
      let compressedImageData = image.jpegData(compressionQuality: 1)
      photoPicker.image = UIImage(data: compressedImageData!)!
    }
  }
}
  // /////////////  DELEGATE //////////////////// //
