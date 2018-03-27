//
//  ViewController.swift
//  Day 4 - CustomPopupWithBlurrBackgroundView
//
//  Created by Prashant Gaikwad on 3/27/18.
//  Copyright © 2018 Left Right Mind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var visualEffectView: UIVisualEffectView!
  
  @IBOutlet var addItemPopup: UIView!
  
  var effect: UIVisualEffect?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    effect = visualEffectView.effect
    visualEffectView.effect = nil
    
    addItemPopup.layer.cornerRadius = 5
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  func animateIn() {
      self.view.addSubview(addItemPopup)
      addItemPopup.center = view.center
    
      addItemPopup.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
      addItemPopup.alpha = 0
    
    UIView.animate(withDuration: 0.4) {
        self.addItemPopup.alpha = 1
        self.visualEffectView.effect = self.effect

      self.addItemPopup.transform = CGAffineTransform.identity
    }
  }
  
  func animateOut () {
    UIView.animate(withDuration: 0.3, animations: {
      self.addItemPopup.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
      self.addItemPopup.alpha = 0
      
      self.visualEffectView.effect = nil
      
    }) { (success:Bool) in
      self.addItemPopup.removeFromSuperview()
    }
  }

  @IBAction func addItem(_ sender: Any) {
    animateIn()
  }
  
  @IBAction func dismissPopup(_ sender: Any) {
    animateOut()
  }
  
}

