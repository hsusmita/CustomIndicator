//
//  ViewController.swift
//  CustomIndicator
//
//  Created by hsusmita on 10/08/15.
//  Copyright (c) 2015 hsusmita.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var indicatorView: CustomActivityIndicatorView?
  
  @IBOutlet weak var loaderView: CustomActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    let image = UIImage(named: "swirl")
//    indicatorView = CustomActivityIndicatorView(image: image!, frame: CGRectMake(CGRectGetWidth(self.view.frame)/2 - 50 , CGRectGetHeight(self.view.frame)/2-50, 100, 100))
//    self.view.addSubview(indicatorView!)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func toggleAnimation(sender: UIButton) {
    if (!loaderView!.isAnimating) {
      loaderView!.startAnimating()
      sender.setTitle("Stop", forState: UIControlState.Normal)
    }else {
      loaderView!.stopAnimating()
      sender.setTitle("Start", forState: UIControlState.Normal)
    }
  }

}

