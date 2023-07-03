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
        
        setLightOff(for: redLightView)
        setLightOff(for: yellowLightView)
        setLightOff(for: greenLightView)
        
        changeLightButton.setTitle("Start", for: .normal)
        
        print(redLightView.bounds.width / 2)
    }
    
    override func viewDidLayoutSubviews() {
        makeCircle(from: redLightView)
        makeCircle(from: yellowLightView)
        makeCircle(from: greenLightView)
        
        print(redLightView.bounds.width / 2)
    }

    @IBAction func changeLightButtonDidPressed() {
        countOfTap += 1
        
        if countOfTap == 1 {
            changeLightButton.setTitle("Next", for: .normal)
        }
        
        switch countOfTap % 3 {
        case 1:
            setLightOn(for: redLightView)
            setLightOff(for: greenLightView)
        case 2:
            setLightOn(for: yellowLightView)
            setLightOff(for: redLightView)
        default:
            setLightOn(for: greenLightView)
            setLightOff(for: yellowLightView)
        }
    }
    
    private func setLightOff(for light: UIView) {
        light.alpha = 0.3
    }
    private func setLightOn(for light: UIView) {
        light.alpha = 1
    }
    private func makeCircle(from view: UIView) {
        view.layer.cornerRadius = view.bounds.width / 2
    }
}

