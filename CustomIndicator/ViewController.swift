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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let image = UIImage(named: "swirl")
    indicatorView = CustomActivityIndicatorView(indicatorImage: image!, frame: CGRectMake(CGRectGetWidth(self.view.frame)/2 - 50 , CGRectGetHeight(self.view.frame)/50, 100, 100))
    self.view.addSubview(indicatorView!)
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func toggleAnimation(sender: UIButton) {
    if (!indicatorView!.isAnimating) {
      indicatorView!.startAnimating()
      sender.setTitle("Stop", forState: UIControlState.Normal)
    }else {
      indicatorView!.stopAnimating()
      sender.setTitle("Start", forState: UIControlState.Normal)
    }
  }

}

