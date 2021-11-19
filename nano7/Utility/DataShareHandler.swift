//
//  DataShareHandler.swift
//  nano7
//
//  Created by Rafael Basso on 18/11/21.
//

import UIKit

class DataShareHandler {
    
    
    // Salvar imagem no disco
    // Source: https://stackoverflow.com/a/53894441/10845180
    
    private func saveImage(image: UIImage) {

     guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }

        let fileName = "DrawMap_saved_\(Date().timeIntervalSinceReferenceDate)"
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return }
        
        //Checks if file exists, removes it if so.
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
        }

        do {
            try data.write(to: fileURL)
        } catch let error {
            print("error saving file with error", error)
        }

    }
    
    // Compartilhar imagem
    // Source: https://stackoverflow.com/a/35931947/10845180
    
    func shareImage(from view: UIView, presentOn viewController: UIViewController) {
        
        // image to share
        let image = view.takeScreenshot()
        
        // set up activity view controller
        let imageToShare = [ image ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        // present the view controller
        viewController.present(activityViewController, animated: true, completion: nil)
    }
    
}

// Capturar imagem de uma UIView
// Source: https://stackoverflow.com/a/31582354/10845180

extension UIView {

    func takeScreenshot() -> UIImage {

        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)

        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)

        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if (image != nil)
        {
            return image!
        }
        return UIImage()
    }
}
