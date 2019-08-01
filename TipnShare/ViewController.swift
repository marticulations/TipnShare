//
//  ViewController.swift
//  TipnShare
//
//  Created by Sushant on 7/30/19.
//  Copyright © 2019 Sushant Gargya. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billTF: UITextField!
    @IBOutlet weak var tipTF: UITextField!
    @IBOutlet weak var tipAmountTF: UITextField!
    @IBOutlet weak var tip_slider: UISlider!
    @IBOutlet weak var split_slider: UISlider!
    @IBOutlet weak var payoutTF: UITextField!
    @IBOutlet weak var totalTF: UITextField!
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var splitTF: UITextField!
    
    let appTitle = "Tip-n-Share"
    let version = 1.0
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1 {
            textField.text = "$"
        }
        
        if textField.tag == 2 {
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeApp()
        
    }
    
    func initializeApp() {
        appTitleLabel.text = appTitle
        setDelegateForUIComponents()
    }
    
    func setDelegateForUIComponents() {
        billTF.delegate = self
        
    }

    @IBAction func tipSliderChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        tipTF.text = "\(currentValue)%"
        calculateBill()
    }
    
    @IBAction func splitSlideChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        splitTF.text = "\(currentValue)"
        shareWith(people: currentValue)
    }
    
    @IBAction func ten_percent_Btn(_ sender: UIButton) {
        billTF.resignFirstResponder()
        tipTF.text = "10%"
        setSliderToValue(value: 10)
        calculateBill()
    }
    
    @IBAction func fiteen_percent_Btn(_ sender: UIButton) {
        billTF.resignFirstResponder()
        tipTF.text = "15%"
        setSliderToValue(value: 15)
        calculateBill()
    }
    
    @IBAction func eighteen_percent_Btn(_ sender: UIButton) {
        billTF.resignFirstResponder()
        tipTF.text = "18%"
        setSliderToValue(value: 18)
        calculateBill()
    }
    
    @IBAction func twenty_percent_Btn(_ sender: UIButton) {
        billTF.resignFirstResponder()
        tipTF.text = "20%"
        setSliderToValue(value: 20)
        calculateBill()
    }
    
    @IBAction func twentyfive_percent_Btn(_ sender: UIButton) {
        billTF.resignFirstResponder()
        tipTF.text = "25%"
        setSliderToValue(value: 25)
        calculateBill()
    }
    
    @IBAction func twoWayBtn(_ sender: UIButton) {
        shareWith(people: 2)
        setSplitSliderToValue(value: 2)
    }
    
    @IBAction func threeWay(_ sender: Any) {
        shareWith(people: 3)
        setSplitSliderToValue(value: 3)
    }
    
    @IBAction func fourWay(_ sender: UIButton) {
        shareWith(people: 4)
        setSplitSliderToValue(value: 4)
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
        billTF.text = ""
        tipTF.text = ""
        tip_slider.setValue(0, animated: true)
        totalTF.text = ""
        payoutTF.text = ""
        tipAmountTF.text = ""
        splitTF.text = ""
        split_slider.setValue(1, animated: true)
        billTF.resignFirstResponder()
    }
    
    func setSliderToValue(value: Float) {
        tip_slider.setValue(value, animated: true)
    }
    
    func setSplitSliderToValue(value: Float) {
        split_slider.setValue(value, animated: true)
        splitTF.text = String(Int(value))
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
            var billStr = billTF.text!
            billStr.remove(at: billStr.startIndex)
            let bill = Double(billStr)
            let tip  = Double(tipTF.text!.dropLast())
            
            if bill != nil && tip != nil {
                let tipPart = bill! * tip!/100
                let total =  bill! + tipPart
                tipAmountTF.text = String(format: "$%.2f",tipPart)
                totalTF.text = String(format: "$%.2f",total)
            }
            
        }
    }
    
}

