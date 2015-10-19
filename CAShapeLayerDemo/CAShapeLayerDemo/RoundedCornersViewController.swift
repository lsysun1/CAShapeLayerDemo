//
//  RoundedCornersViewController.swift
//  CAShapeLayerDemo
//
//  Created by Guanshan Liu on 27/2/15.
//  Copyright (c) 2015 Guanshan Liu. All rights reserved.
//

import UIKit

class RoundedCornersViewController: TapToCloseViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        let center = view.center

        // There are different ways to draw rounded rectangles.
    
        
        // Create CAShapeLayerS
        let rectShape1 = CAShapeLayer()
        rectShape1.bounds = bounds
        rectShape1.position = CGPoint(x: center.x, y: center.y - 120)
        view.layer.addSublayer(rectShape1)
        
        let rectShape2 = CAShapeLayer()
        rectShape2.bounds = bounds
        rectShape2.position = center
        view.layer.addSublayer(rectShape2)
        
        let rectShape3 = CAShapeLayer()
        rectShape3.bounds = bounds
        rectShape3.position = CGPoint(x: center.x, y: center.y + 120)
        view.layer.addSublayer(rectShape3)

        // Apply effects here
        
        //1. The first way to draw a rounded rectangle is to change a layer’s cornerRadius property. This applies to all CALayerS.
        rectShape1.backgroundColor = UIColor.redColor().CGColor;
        rectShape1.cornerRadius = 20.0;
        
        //2. We could also use path to draw a rounded rectangle.
        //   Assign a rounded rectangle path via this convenient method on UIBezierPath. 
        //   By doing this, we have to use fillColor instead of backgroundColor. 
        //   Because backgroundColor is color of the layer’s background, while fillColor is the color used to fill the shape’s path.
        rectShape2.fillColor = UIColor.greenColor().CGColor;
        rectShape2.path = UIBezierPath(roundedRect: rectShape2.bounds, cornerRadius: 20).CGPath;
        
        //3. Using path, we are not limited to round all corners. 
        //   We could specify which corner we want to round. In this example, I only change bottom left and top right corners.
        rectShape3.fillColor = UIColor.blueColor().CGColor;
        rectShape3.path = UIBezierPath(roundedRect: rectShape3.bounds, byRoundingCorners:[UIRectCorner.BottomRight , UIRectCorner.TopLeft], cornerRadii: CGSize(width: 20, height: 20)).CGPath;
        
        
        
        
    }

}
