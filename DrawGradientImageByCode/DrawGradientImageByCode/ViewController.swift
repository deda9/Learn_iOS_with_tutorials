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
        drawGradientImage(size, colors: [UIColor.red, UIColor.yellow, UIColor.green])
    }

    private func drawGradientImage(_ size: CGSize, colors: [UIColor]) {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorComponents = colors.compactMap{ $0.cgColor.components }.flatMap{ $0 }
        let colorsCount = colors.count
        let locations: [CGFloat] = colors.enumerated().map{ CGFloat($0.offset) / CGFloat(colorsCount-1) }
        print(locations)
        
        guard let gradient = CGGradient(colorSpace: colorSpace, colorComponents: colorComponents, locations: locations, count: colorsCount) else {
            return
        }
        
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: size.width, y: size.height)
        
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions())
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return
        }
        
        imageView.image = image
    }
}

