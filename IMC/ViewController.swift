//
//  ViewController.swift
//  IMC
//
//  Created by Juanma on 17/11/2026.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var heigthLabel: UILabel!
    @IBOutlet weak var weigthLabel: UILabel!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var heigth = 169.0
    var weigth = 70.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heigthChanger(_ sender: UISlider) {
        heigth = Double(sender.value).rounded()
        heigthLabel.text = "\(Int(heigth))"
    }
    
    @IBAction func weigthChanger(_ sender: UIStepper) {
        weigth = sender.value
        weigthLabel.text = "\(Int(weigth))"
    }
    
    @IBAction func calcuateBMI(_ sender: Any){
        let heigthInMeters = heigth / 100
        let result = weigth / pow(heigthInMeters, 2)
        resultLabel.text = String(format: "%.2f", result)
        
    }
}

