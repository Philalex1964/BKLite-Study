//
//  ShadowViewController.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 14.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit

@IBDesignable class ShadowView: UIView {
    
    @IBInspectable public var filled = true {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var radius: CGFloat = 25
    
}

extension UIView {
    
    @IBInspectable var shadowColor: CGColor {
        set { layer.shadowColor = newValue}
        get { return layer.shadowColor ?? UIColor.blue.cgColor}
    }
    @IBInspectable var shadowOpacity: Float {
        set { layer.shadowOpacity = newValue}
        get { return layer.shadowOpacity }
    }
    @IBInspectable var shadowRadius: CGFloat {
        set { layer.shadowRadius = newValue}
        get { return layer.shadowRadius}
    }
    @IBInspectable var shadowOffset: CGSize {
        set { layer.shadowOffset = newValue}
        get { return layer.shadowOffset}
    }
}

//class ShadowViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
