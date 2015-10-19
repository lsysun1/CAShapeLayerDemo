//
//  StrokeViewController.swift
//  CAShapeLayerDemo
//
//  Created by Guanshan Liu on 27/2/15.
//  Copyright (c) 2015 Guanshan Liu. All rights reserved.
//

import UIKit

class StrokeViewController: TapToCloseViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let bounds = CGRect(x: 0, y: 0, width: 100, height: 100)

        
        //  strokeStart and strokeEnd defines the relative location at which to begin stroking the path, ranging from 0 to 1.
        //  Many cool activity indicator can be made by using them. Here is a simple example that show you how to animate these properties.
        
        
        // Create CAShapeLayerS
        let rectShape = CAShapeLayer()
        rectShape.bounds = bounds
        rectShape.position = view.center
        rectShape.cornerRadius = bounds.width / 2
        view.layer.addSublayer(rectShape)

        // Apply effects here
        // 1
        // Here is another way to draw a circle using another UIBezierPath’s convenient initializer.
        rectShape.path = UIBezierPath(ovalInRect: rectShape.bounds).CGPath
        
        rectShape.lineWidth = 4.0
        rectShape.strokeColor = UIColor.lightGrayColor().CGColor
        rectShape.fillColor = UIColor.clearColor().CGColor
        
        // 2
        // Set the initial values for strokeStart and strokeEnd.
        rectShape.strokeStart = 0
        rectShape.strokeEnd = 0.5
        
        // 3
        // Create animations like before.
        let start = CABasicAnimation(keyPath: "strokeStart")
        start.toValue = 0.7
        let end = CABasicAnimation(keyPath: "strokeEnd")
        end.toValue = 1
        
        // 4
        // Group two animation together. 
        // Because we want to both animations to happen simultaneously.
        // The duration is 1.5 seconds. 
        // It will auto reverse the animations upon finishing.
        // And it will repeat forever.
        let group = CAAnimationGroup()
        group.animations = [start, end]
        group.duration = 1.5
        group.autoreverses = true
        group.repeatCount = HUGE // repeat forver
        rectShape.addAnimation(group, forKey: nil)
        
    }

}
