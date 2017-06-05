//
//  ViewController.swift
//  CoreAnimationDemo
//
//  Created by Vikash Kumar on 06/03/17.
//  Copyright © 2017 Vikash Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgRocket: UIImageView!
    @IBOutlet var imgRocket2: UIImageView!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var imgSettalite: UIImageView!
    @IBOutlet var cardView: UIView!
    @IBOutlet var cardView2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.translateRocket()
        //self.groupAnimation()
        //animateWobble()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func loginBtnClicked(sender: UIButton) {
        self.shakePasswordField()
        self.pathAnimation()
    }
    
    @IBAction func pausePlayAnimation(sender: UIButton) {
        
    }
}

extension ViewController {
    
    func translateRocket() {
        let ani = CABasicAnimation()
        ani.keyPath = "position.x"
        ani.fromValue = 10 //
        ani.toValue = 375
        ani.duration = 5
        //ani.speed = 2
        //ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        ani.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0.9, 0.8, 0.7)
        ani.repeatCount = Float.infinity
        imgRocket.layer.add(ani, forKey: "moveRocket")
        
        //ani.beginTime = CACurrentMediaTime() + 0.5
        // imgRocket2.layer.add(ani, forKey: "basic")
    }

    func shakePasswordField() {
        let ani = CAKeyframeAnimation()
        ani.keyPath = "position.x"
        ani.duration = 0.4
        ani.values = [0, 10, -10, 10, 0]
        ani.keyTimes = [NSNumber(value: 0), NSNumber(value: 0.2), NSNumber(value: 0.5), NSNumber(value: 0.8), NSNumber(value: 1)]

        ani.isAdditive = true
        txtPassword.layer.add(ani, forKey: "shake")
        
        let ani2 = CAKeyframeAnimation()
        ani2.keyPath = "backgroundColor"
        ani2.duration = 10
        ani2.values = [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.orange.cgColor]
        ani2.keyTimes = [NSNumber(value: 0), NSNumber(value: 0.5), NSNumber(value: 1)]
        ani2.repeatCount = Float.infinity
        ani2.isAdditive = true
        txtPassword.layer.add(ani2, forKey: "backColor")
    }
    
    //Animation along a path
    func pathAnimation() {
        let boundRect = CGRect(x: -80, y: -80, width: 160, height: 160)
        
        let orbit = CAKeyframeAnimation()
        orbit.keyPath = "position"
        orbit.duration = 4.0
        
        let path = UIBezierPath(ovalIn: boundRect)
        
        orbit.path = path.cgPath
        orbit.isAdditive = true
        orbit.repeatCount = Float.infinity
        orbit.calculationMode = kCAAnimationPaced
        orbit.rotationMode =  kCAAnimationRotateAuto
        
        imgSettalite.layer.add(orbit, forKey: "settaliteAni")
    }
    
    //Grouping animation
    func groupAnimation() {
        let zAni = CABasicAnimation()
        zAni.keyPath = "zPosition"
        zAni.fromValue = -1
        zAni.toValue = 1
        zAni.duration = 1.2
        
        let rotation = CAKeyframeAnimation()
        rotation.keyPath = "transform.rotation"
        rotation.values = [0, (M_PI * 10 / 180), 0]
        rotation.duration = 1.2
        //rotation.repeatCount = Float(CGFloat.infinity)
        rotation.timingFunctions =   [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut) ]
       // cardView.layer.add(rotation, forKey: "rotation")
        
        
        let translate = CAKeyframeAnimation()
        translate.keyPath = "position"
        let center = cardView.center
        translate.values = [center, CGPoint(x: center.x + 115, y: center.y - 20), center]
        translate.duration = 1.2
        translate.timingFunctions =   [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut) ]
        
        let group = CAAnimationGroup()
        group.animations = [rotation, translate, zAni]
        group.duration = 1.2
        group.beginTime = 0.5
        group.repeatCount = Float.infinity
        cardView.layer.add(group, forKey: "swipe")
        
        
        let rotation2 = CAKeyframeAnimation()
        rotation2.keyPath = "transform.rotation"
        rotation2.values = [0,  (M_PI * -10 / 180), 0]
        rotation2.duration = 1.2
        //rotation.repeatCount = Float(CGFloat.infinity)
        rotation2.timingFunctions =   [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut) ]
        // cardView.layer.add(rotation, forKey: "rotation")
        
        
        let translate2 = CAKeyframeAnimation()
        translate2.keyPath = "position"
        let center2 = cardView.center
        translate2.values = [center2, CGPoint(x: center2.x - 115, y: center2.y - 20), center2]
        translate2.duration = 1.2
        translate2.timingFunctions =   [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut) ]
        
        let group2 = CAAnimationGroup()
        group2.animations = [rotation2, translate2]
        group2.duration = 1.2
        group2.beginTime = 0.5
        group2.repeatCount = Float.infinity

        
        cardView2.layer.add(group2, forKey: "swipe")
        
    }
    
    func animateMorpX() {
        let morphX = CAKeyframeAnimation()
        morphX.keyPath = "transform.scale.x"
        morphX.values = [1, 1.6, 0.7, 1.3, 1]
        morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        //morphX.timingFunction = getTimingFunction(curve: curve)
        morphX.duration = CFTimeInterval(3.0)
        morphX.repeatCount = Float.infinity
       // morphX.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
        cardView.layer.add(morphX, forKey: "morphX")

    }
    
    func animateWobble() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "transform.rotation"
        animation.values = [0, 0.3, -0.3, 0.3, 0]
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        animation.duration = CFTimeInterval(3.0)
        animation.isAdditive = true
        cardView.layer.add(animation, forKey: "wobble")

    }
}

