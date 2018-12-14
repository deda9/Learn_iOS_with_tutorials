//
//  ViewController.swift
//  DrawImageByCode
//
//  Created by Bassem Qoulta on 12/14/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = CGSize(width: 100, height: 100)
        drawImage(size, color: UIColor.red)
    }

    private func drawImage(_ size: CGSize, color: UIColor) {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        
        color.setFill()
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIRectFill(rect)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return
        }
        
        imageView.image = image
    }
}

