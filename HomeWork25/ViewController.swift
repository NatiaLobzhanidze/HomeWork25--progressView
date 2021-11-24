//
//  ViewController.swift
//  HomeWork25
//
//  Created by Natia's Mac on 24/11/2021.
//

import UIKit

class ViewController: UIViewController {
    let shape = CAShapeLayer()
    @IBOutlet weak var progressLabel: UILabel!
//    var startValue = 0
//    var endValue = 100
//    let animDuration = 12
    
    let animationStart = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let circlePath = UIBezierPath(arcCenter: view.center,
                                      radius: 150,
                                      startAngle: -(.pi / 2),
                                      endAngle: .pi * 2,
                                      clockwise: true)
        
        //Background Ring
        
        let backgroundShape = CAShapeLayer()
        backgroundShape.path = circlePath.cgPath
        backgroundShape.lineWidth = 15
        backgroundShape.strokeColor = UIColor.lightGray.cgColor
        backgroundShape.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(backgroundShape)
        
        //Ring
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 15
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)

    }

    @IBAction func fillColor(_ sender: Any) {
        changeValue()
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 5.9
        shape.add(animation, forKey: "animation")
    }
    
    func changeValue(){
        let displayLink = CADisplayLink(target: self, selector: #selector(percentUpdate))
        displayLink.add(to: .main, forMode: .default)
       
        
    }
    var startValue: Double = 0
    let endValue: Double = 100
    let animationDuration: Double = 6.0
    let animationStartDate = Date()

    @objc func percentUpdate(){
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)

        if elapsedTime > Double( animationDuration) {
            let intValue = Int (endValue)
            self.progressLabel.text = "\(intValue)" + "%"
        } else {
            print(elapsedTime)
            let percentage = elapsedTime / animationDuration
            let value = Int (percentage * ( endValue - startValue))
            self.progressLabel.text = "\(value)" + "%"
        }
    }
    
}

