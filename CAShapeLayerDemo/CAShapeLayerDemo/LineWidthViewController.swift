//
//  LineWidthViewController.swift
//  CAShapeLayerDemo
//
//  Created by Guanshan Liu on 27/2/15.
//  Copyright (c) 2015 Guanshan Liu. All rights reserved.
//

import UIKit

class LineWidthViewController: TapToCloseViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let bounds = CGRect(x: 0, y: 0, width: 100, height: 100)

        //  lineWidth defines the stroke line width of the shape’s path, and it’s also animatable.
        //  There are some cool effects we could make via lineWidth.
        
        
        // Create CAShapeLayerS
        let rectShape = CAShapeLayer()
        rectShape.bounds = bounds
        rectShape.position = view.center
        rectShape.cornerRadius = bounds.width / 2
        view.layer.addSublayer(rectShape)

        // Apply effects here
        // setup
        let rect = CGRect(x: 0, y: 0, width: view.bounds.width, height: 1)
        rectShape.bounds = rect
        rectShape.position = view.center
        rectShape.path = UIBezierPath(rect:rect).CGPath
        
        // 1
        // Give an initial line width of 10 points. To set the line color, we use strokeColor.
        rectShape.lineWidth = 10
        rectShape.strokeColor = UIColor.blueColor().CGColor
        
        // animate
        let animation = CABasicAnimation(keyPath: "lineWidth")
        // 2
        animation.toValue = 1000
        animation.duration = 1 // duration is 1 sec
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
        animation.fillMode = kCAFillModeBoth                                                  // keep to value after finishing
        animation.removedOnCompletion = false                                                 // don't remove after finishing
        rectShape.addAnimation(animation, forKey: animation.keyPath)
    
        
    }

}
