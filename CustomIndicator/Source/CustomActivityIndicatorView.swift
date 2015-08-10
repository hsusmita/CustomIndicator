//
//  CustomActivityIndicatorView.swift
//  CustomIndicator
//
//  Created by hsusmita on 10/08/15.
//  Copyright (c) 2015 hsusmita.com. All rights reserved.
//

import UIKit

 class CustomActivityIndicatorView: UIView {

  var hidesWhenStopped: Bool
  var isAnimating: Bool
  
  private var animationLayer: CALayer
  
  convenience init(indicatorImage:UIImage,frame:CGRect) {
    self.init(frame:frame)
    configureAnimationLayer(indicatorImage)
  }
  
  required init(coder aDecoder: NSCoder) {
    hidesWhenStopped = false
    isAnimating = false
    animationLayer = CALayer()
    super.init(coder: aDecoder)
  }
  
   override init(frame: CGRect) {
    hidesWhenStopped = false
    isAnimating = false
    animationLayer = CALayer()
    super.init(frame: frame)
  }
  
  func startAnimating() {
    if animationLayer.animationForKey("rotation") == nil {
      animationLayer.addAnimation(rotationAnimation(), forKey: "rotation")
    }
    
    if self.hidesWhenStopped {
      self.hidden = false
    }
    resumeLayer()
    isAnimating = true;
  }
  
  func stopAnimating() {
    if self.hidesWhenStopped {
      self.hidden = true
    }
    pauseLayer()
    isAnimating = false
  }
  
  private func configureAnimationLayer(indicatorImage:UIImage) {
    animationLayer.frame =  CGRectMake(0,0,indicatorImage.size.width,indicatorImage.size.height)
    animationLayer.contents = indicatorImage.CGImage
    animationLayer.masksToBounds = true
    layer.addSublayer(animationLayer)
  }
  
  private func rotationAnimation()-> CABasicAnimation {
    var rotation = CABasicAnimation(keyPath: "transform.rotation.z")
    rotation.duration = 1.0
    rotation.removedOnCompletion = false;
    rotation.repeatCount = Float.infinity
    rotation.fillMode = kCAFillModeForwards;
    rotation.fromValue = 0.0
    rotation.toValue = 3.14*2;
    return rotation
  }
  
  private func pauseLayer() {
    let pausedTime = animationLayer.convertTime(CACurrentMediaTime(), fromLayer: nil)
    animationLayer.speed = 0.0
    animationLayer.timeOffset = pausedTime
  }
  
  private func resumeLayer() {
    let pauseTime = animationLayer.timeOffset
    animationLayer.speed = 1.0
    animationLayer.timeOffset = 0.0
    let timeSincePause = layer.convertTime(CACurrentMediaTime(), fromLayer: nil) - pauseTime
    animationLayer.beginTime = timeSincePause
  }
  
}
