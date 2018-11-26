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
        imageView.applyFilter(name: "CISepiaTone", options: [kCIInputIntensityKey : 0.5])
        imageView.applyFilter(name: "CIMinimumComponent", options: [:])
    }
}

extension UIImageView {
    func applyFilter(name: String, options: [String : Any]) {
        let context = CIContext()
        
        guard let filter = CIFilter(name: name) else {
            return
        }
        
        options.keys.forEach {
            filter.setValue(options[$0], forKey: $0)
        }
        
        guard let image = self.image else {
            return
        }
        
        let ciImage = CIImage(image: image)
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        
        guard let outputImage = filter.outputImage else {
            return
        }
        
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
            return
        }
        self.image = UIImage(cgImage: cgImage)
    }
}

