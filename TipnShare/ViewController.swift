//
//  ViewController.swift
//  TipnShare
//
//  Created by Sushant on 7/30/19.
//  Copyright © 2019 Sushant Gargya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTF: UITextField!
    @IBOutlet weak var tipTF: UITextField!
    @IBOutlet weak var tip_slider: UISlider!
    @IBOutlet weak var payoutTF: UITextField!
    @IBOutlet weak var totalTF: UITextField!
    @IBOutlet weak var appTitleLabel: UILabel!
    
    let appTitle = "Tip-n-Share"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeApp()
        
    }
    
    func initializeApp() {
        appTitleLabel.text = appTitle
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        tipTF.text = "\(currentValue)%"
        calculateBill()
    }
    
    @IBAction func ten_percent_Btn(_ sender: UIButton) {
        tipTF.text = "10%"
        setSliderToValue(value: 10)
        calculateBill()
    }
    
    @IBAction func fiteen_percent_Btn(_ sender: UIButton) {
        tipTF.text = "15%"
        setSliderToValue(value: 15)
        calculateBill()
    }
    
    @IBAction func eighteen_percent_Btn(_ sender: UIButton) {
        tipTF.text = "18%"
        setSliderToValue(value: 18)
        calculateBill()
    }
    
    @IBAction func twenty_percent_Btn(_ sender: UIButton) {
        tipTF.text = "20%"
        setSliderToValue(value: 20)
        calculateBill()
    }
    
    @IBAction func twentyfive_percent_Btn(_ sender: UIButton) {
        tipTF.text = "25%"
        setSliderToValue(value: 25)
        calculateBill()
    }
    
    @IBAction func twoWayBtn(_ sender: UIButton) {
        shareWith(people: 2)
    }
    
    @IBAction func threeWay(_ sender: Any) {
        shareWith(people: 3)
    }
    
    @IBAction func fourWay(_ sender: UIButton) {
        shareWith(people: 4)
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
        billTF.text = ""
        tipTF.text = ""
        tip_slider.setValue(0, animated: true)
        totalTF.text = ""
        payoutTF.text = ""
    }
    
    func setSliderToValue(value: Float) {
        tip_slider.setValue(value, animated: true)
    }
    func shareWith(people: Int) {
        if totalTF.text != "" {
            var totalStr = totalTF.text!
            totalStr.remove(at: totalStr.startIndex)
            let total = Double(totalStr)
            let share: Double = total! / Double(people)
            payoutTF.text = String(format: "$%.2f",share)
        }
    }
    func calculateBill() {
        if billTF.text != "" && tipTF.text != "" {
            let bill = Double(billTF.text!)
            let tip  = Double(tipTF.text!.dropLast())
            
            if bill != nil && tip != nil {
                let total = bill! * tip!/100 + bill!
                totalTF.text = String(format: "$%.2f",total)
            }
            
        }
    }
    
}

