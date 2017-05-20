//
//  VerticallyButton.swift
//  VerticallyButton
//
//  Created by Masher Shin on 2/15/17.
//  Copyright © 2017 Masher Shin. All rights reserved.
//

import UIKit

@IBDesignable
open class VerticallyButton: UIButton {
    @IBInspectable
    open var verticallyAlign: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    open var verticallySpacing: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    open var verticallyPoint: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    open var secondaryImage: UIImage? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    open var secondaryHighlightedImage: UIImage? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private func configureVertically() {
        guard verticallyAlign else { return }
        
        if let secondaryImage = isHighlighted ? secondaryHighlightedImage : secondaryImage {
            let secondaryImageSize = secondaryImage.size
            
            imageEdgeInsets = UIEdgeInsets(top: -(secondaryImageSize.height + verticallySpacing) - verticallyPoint.y,
                                           left: -verticallyPoint.x,
                                           bottom: verticallySpacing + verticallyPoint.y,
                                           right: verticallyPoint.x)
            
            secondaryImage.draw(at: CGPoint(x: bounds.width / 2 - secondaryImageSize.width / 2 + verticallyPoint.x,
                                            y: bounds.height / 2 + verticallySpacing + verticallyPoint.y))
            
        } else {
            let imageSize = imageView?.frame.size ?? CGSize(width: 0, height: 0)
            
            let titleSize = titleLabel?.frame.size ?? CGSize(width: 0, height: 0)
            
            imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + verticallySpacing) - verticallyPoint.y,
                                           left: 0 - verticallyPoint.x,
                                           bottom: 0 + verticallyPoint.y,
                                           right: -titleSize.width + verticallyPoint.x)
            
            titleEdgeInsets = UIEdgeInsets(top: 0 - verticallyPoint.y,
                                           left: -imageSize.width - verticallyPoint.x,
                                           bottom: -(imageSize.height + verticallySpacing) + verticallyPoint.y,
                                           right: 0 + verticallyPoint.x)
        }
    }
    
    override open func draw(_ rect: CGRect) {
        invalidateIntrinsicContentSize()
        configureVertically()
        super.draw(rect)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        setNeedsDisplay()
    }
    
    override open var intrinsicContentSize: CGSize {
        let imageSize = imageView?.frame.size ?? CGSize(width: 0, height: 0)
        // Fix: title not display normally in XIB
        titleLabel?.sizeToFit()
        let titleSize = titleLabel?.frame.size ?? CGSize(width: 0, height: 0)
        return CGSize(width: max(imageSize.width, titleSize.width),
                      height: imageSize.height + titleSize.height + verticallySpacing + 12) // 12 = top margin + bottom margin
    }
}
