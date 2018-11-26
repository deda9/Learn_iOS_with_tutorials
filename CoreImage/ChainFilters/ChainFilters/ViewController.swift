//
//  ViewController.swift
//  Filters
//
//  Created by Bassem Qoulta on 11/26/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "bird")
        
        let cgImage =
            imageView
                .applyingFilter("CISepiaTone", parameters: [kCIInputIntensityKey : 0.5])?
                .applyingFilter("CIMinimumComponent", parameters: [:])
                .applyingFilter("CIToneCurve", parameters: ["inputPoint0" : CIVector(x: 1, y: 0.6),
                                                            "inputPoint1" : CIVector(x: 0.25, y: 0.25),
                                                            "inputPoint2" : CIVector(x: 0.56, y: 0.5),
                                                            "inputPoint3" : CIVector(x: 0.25, y: 0.75),
                                                            "inputPoint4" : CIVector(x: 0.97, y: 0.2),
                                                            ])
                .asCGImage()
        imageView.image = UIImage(cgImage: cgImage!)
    }
}

extension UIImageView {
    func applyingFilter(_ name: String, parameters: [String : Any]) -> CIImage? {
        guard let filter = CIFilter(name: name) else {
            return nil
        }
        
        parameters.keys.forEach {
            filter.setValue(parameters[$0], forKey: $0)
        }
        
        guard let image = self.image else {
            return nil
        }
        
        let ciImage = CIImage(image: image)
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        
        return filter.outputImage
    }
}

extension CIImage {
    func asCGImage() -> CGImage? {
        let context = CIContext()
        return context.createCGImage(self, from: self.extent)
    }
}

