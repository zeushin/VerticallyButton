//
//  VerticallyButton.swift
//  VerticallyButton
//
//  Created by Masher Shin on 2/15/17.
//  Copyright © 2017 Masher Shin. All rights reserved.
//

import UIKit

@IBDesignable
class VerticallyButton: UIButton {
    @IBInspectable
    var verticallyAlign: Bool = false {
        didSet {
            configureVertically()
        }
    }
    
    @IBInspectable
    var verticallySpacing: CGFloat = 0 {
        didSet {
            configureVertically()
        }
    }
    
    @IBInspectable
    var verticallyPoint: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            configureVertically()
        }
    }
    
    private func configureVertically() {
        let imageSize = imageView?.frame.size ?? CGSize(width: 0, height: 0)
        
        titleEdgeInsets = UIEdgeInsets(top: 0 - verticallyPoint.y,
                                       left: -imageSize.width - verticallyPoint.x,
                                       bottom: -(imageSize.height + verticallySpacing) + verticallyPoint.y,
                                       right: 0 + verticallyPoint.x)
        
        let titleSize = titleLabel?.frame.size ?? CGSize(width: 0, height: 0)
        
        imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + verticallySpacing) - verticallyPoint.y,
                                       left: 0 - verticallyPoint.x,
                                       bottom: 0 + verticallyPoint.y,
                                       right: -titleSize.width + verticallyPoint.x)
        
        setNeedsDisplay()
    }
}
