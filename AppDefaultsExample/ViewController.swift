//
//  ViewController.swift
//  AppDefaultsExample
//
//  Created by Yuske Fukuyama on 2018/11/22.
//  Copyright © 2018 Yuske Fukuyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    AppDefaults.doYouLoveMe = true
  }
}
