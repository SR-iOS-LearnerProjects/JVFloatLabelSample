//
//  ViewController.swift
//  JVFloatLableSample
//
//  Created by Sridatta Nallamilli on 03/03/20.
//  Copyright © 2020 Sridatta Nallamilli. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

class ViewController: UIViewController {
    
    @IBOutlet weak var dobTF: UITextField!
    @IBOutlet weak var dobTFBtn: UIButton!
    @IBOutlet weak var pickerPopup: UIView!
    @IBOutlet weak var datePickerView: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!

    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        pickerPopup.isHidden = true
        self.pickerPopup.alpha = 0
        showDatePicker()
        
    }
        
    func showDatePicker() {
        
        datePicker.datePickerMode = .date
        datePicker.tintColor = .cyan
        dobTF.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(datePicker:)), for: UIControl.Event.valueChanged)
    }
    
    @objc func datePickerValueChanged(datePicker: UIDatePicker) {
//        if let datePicker = dobTF.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dobTF.text = dateFormatter.string(from: datePicker.date)
//        }
    }
    
    @IBAction func dobTFTapAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.pickerPopup.alpha = 1
        }
//        pickerPopup.isHidden = false
//        pickerPopup.backgroundColor = .gray
        pickerPopup.layer.cornerRadius = 8
        pickerPopup.layer.borderColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 1.0)
        pickerPopup.layer.borderWidth = 2.0
        
        datePickerView.addSubview(datePicker)
        
        datePicker.tintColor = .white
        datePicker.frame.size.width = self.datePickerView.frame.size.width
        datePicker.frame.size.height = self.datePickerView.frame.size.height
    }
    
    @IBAction func cancelBtnTapAction(_ sender: UIButton) {
//        pickerPopup.isHidden = true
        UIView.animate(withDuration: 0.1) {
            self.pickerPopup.alpha = 0
        }
    }
    
    @IBAction func doneBtnTapAction(_ sender: UIButton) {
//        pickerPopup.isHidden = true
        UIView.animate(withDuration: 0.1) {
            self.pickerPopup.alpha = 0
        }
    }

}

