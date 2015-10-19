//
//  PathViewController.swift
//  CAShapeLayerDemo
//
//  Created by Guanshan Liu on 27/2/15.
//  Copyright (c) 2015 Guanshan Liu. All rights reserved.
//

import UIKit

class PathViewController: TapToCloseViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let bounds = CGRect(x: 0, y: 0, width: 100, height: 100)

        //  path is also an animatable property. We could achieve the basic Material-Design-feel effect by animating it.
        
        
        // Create CAShapeLayerS
        let rectShape = CAShapeLayer()
        rectShape.bounds = bounds
        rectShape.position = view.center
        rectShape.cornerRadius = bounds.width / 2
        view.layer.addSublayer(rectShape)

        // Apply effects here
        
        // fill with yellow
        rectShape.fillColor = UIColor.yellowColor().CGColor

        // 1
        // Calculate begin and end shapes for the animation. Then assign the startShape to path.
        // begin with a circle with a 50 points radius
        let startShape = UIBezierPath(roundedRect: bounds, cornerRadius: 50).CGPath;
        // animation end with a large circle with 500 points radius
        let endShape = UIBezierPath(roundedRect: CGRect(x: -450, y: -450, width: 1000, height: 1000), cornerRadius: 500).CGPath;
        
        // set initial shape
        rectShape.path = startShape;
        
        
        // 2
        // Use CABasicAnimation to animate path. 
        // Destination value for path is the end shape we defined before. Set it to toValue. Then set the animation duration to 1 second.
        let animation = CABasicAnimation(keyPath: "path")
        animation.toValue = endShape
        animation.duration = 1              // duration is 1 sec
        
        // 3
        // Set the animation curve to ease out, making it look more natural.
        // With removedOnCompletion set to false, fillMode to kCAFillModeBoth, when the animation finishes, rectShape will remain the end shape.
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
        animation.fillMode = kCAFillModeBoth                                                  // keep to value after finishing
        animation.removedOnCompletion = false                                                 // don't remove after finishing
        
        // 4 
        // Add the animation to the layer.
        rectShape.addAnimation(animation, forKey: animation.keyPath)
        
        
        
        
        
        
        
        
    }

}
