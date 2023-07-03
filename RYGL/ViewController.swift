//
//  ViewController.swift
//  RYGL
//
//  Created by Goodwasp on 03.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var changeLightButton: UIButton!
    
    private var countOfTap = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lightIsOff(for: redLightView)
        lightIsOff(for: yellowLightView)
        lightIsOff(for: greenLightView)
    }
    
    override func viewDidLayoutSubviews() {
        makeViewCircle(for: redLightView)
        makeViewCircle(for: yellowLightView)
        makeViewCircle(for: greenLightView)
    }

    @IBAction func changeLightButtonDidPressed() {
        countOfTap += 1
        
        if countOfTap == 1 {
            changeLightButton.setTitle("Next", for: .normal)
        }
        
        switch countOfTap % 3 {
        case 1:
            lightIsOn(for: redLightView)
            lightIsOff(for: greenLightView)
        case 2:
            lightIsOn(for: yellowLightView)
            lightIsOff(for: redLightView)
        default:
            lightIsOn(for: greenLightView)
            lightIsOff(for: yellowLightView)
        }
    }
    
    private func lightIsOff(for light: UIView) {
        light.alpha = 0.3
    }
    private func lightIsOn(for light: UIView) {
        light.alpha = 1
    }
    private func makeViewCircle(for view: UIView) {
        view.layer.cornerRadius = view.frame.width / 2
    }
}

