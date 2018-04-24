//
//  ViewController.swift
//  SwitchBoxToy
//
//  Created by Yeongjin Nam on 3/9/18.
//  Copyright © 2018 Yeongjin Nam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var w:CGFloat = 0
    var h:CGFloat = 0
    var elecolor = 0
    var numElephant = 1.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        w = elephantGray.frame.size.width
        h = elephantGray.frame.size.height
        
        whichElephant()
    }
    @IBOutlet weak var showElephant: UISwitch!
    @IBAction func showE(_ sender: UISwitch) {
    }
    @IBOutlet weak var elephantGray: UIImageView!
    
    
    @IBOutlet weak var elephantPink: UIImageView!
    
    @IBAction func elephantShow(_ sender: UISwitch) {
        whichElephant()
    }
    @IBOutlet weak var eColor: UISegmentedControl!
    
    @IBOutlet weak var eCount: UILabel!
    func whichElephant() {
        
        
        if numElephant == 1 {
            eCount.text = "1 elephant"
        }
        else {
            eCount.text =  String(Int(numElephant)) + " elephants"
        }
        
        
        if elecolor == 0 && showElephant.isOn{
            elephantPink.isHidden = true
            elephantGray.isHidden = false
        }
        else if elecolor == 1 && showElephant.isOn{
            elephantGray.isHidden = true
            elephantPink.isHidden = false
        }
        else {
            elephantGray.isHidden = true
            elephantPink.isHidden = true
        }
    }
    
    
    @IBAction func elephantColor(_ sender: UISegmentedControl) {
        switch eColor.selectedSegmentIndex{
        case 0:
            elecolor = 0
        case 1:
            elecolor = 1
        default:
            break
        }
        whichElephant()
    }
    
    @IBOutlet weak var elephantScale: UISlider!
    
    
    @IBAction func scale(_ sender: Any) {
        elephantGray.frame.size.width = w * CGFloat(elephantScale.value)
        elephantGray.frame.size.height = h * CGFloat(elephantScale.value)
        
        elephantPink.frame.size.width = w * CGFloat(elephantScale.value)
        
        elephantPink.frame.size.height = h * CGFloat(elephantScale.value)
        
        
    }
    @IBAction func reset(_ sender: UIButton) {
        eColor.selectedSegmentIndex = 0
        showElephant.setOn(true, animated:true)
        elephantCount.value = 1.0
        numElephant = 1.0
        elecolor = 0
        elephantScale.value = 1
        elephantGray.frame.size.width = w
        elephantGray.frame.size.height = h
        elephantPink.frame.size.width = w
        elephantPink.frame.size.height = h
        whichElephant()
    }
    
    @IBOutlet weak var elephantCount: UIStepper!
    
    
    @IBAction func Step(_ sender: UIStepper) {
    numElephant = elephantCount.value
        
        whichElephant()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

