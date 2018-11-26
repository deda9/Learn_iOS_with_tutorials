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
    
        if var ciImage = imageView.asCIImage() {
            ciImage = ciImage.cropped(to: ciImage.extent.mid())
            imageView.image = UIImage(ciImage: ciImage)
        }
    }
}


extension CGRect {
    func mid() -> CGRect {
        let size = CGSize.init(width: self.width - 100, height: self.height - 100)
        let point = CGPoint.init(x: 0, y: 0)
        let rect = CGRect(origin: point, size: size)
        return rect
    }
}

extension UIImageView {
    
    
    func asCIImage() -> CIImage? {
        return CIImage(image: self.image!)
    }
}

