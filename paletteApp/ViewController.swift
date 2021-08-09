//
//  ViewController.swift
//  paletteApp
//
//  Created by Даниил Петров on 09.08.2021.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet var labelRed: UILabel!
    @IBOutlet var labelGreen: UILabel!
    @IBOutlet var labelBlue: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    @IBOutlet var textFieldRed: UITextField!
    @IBOutlet var textFieldGreen: UITextField!
    @IBOutlet var textFieldBlue: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .white
        
        sliderRed.minimumValue = 0
        sliderRed.maximumValue = 1
        sliderRed.value = 0.5
        labelRed.text = String(sliderRed.value.rounded())
        textFieldRed.text = String(sliderRed.value)
        sliderRed.minimumTrackTintColor = .red.withAlphaComponent(CGFloat(sliderRed.value))
        
        sliderGreen.minimumValue = 0
        sliderGreen.maximumValue = 1
        sliderGreen.value = 0.5
        labelGreen.text = String(sliderGreen.value.rounded())
        textFieldGreen.text = String(sliderGreen.value)
        sliderGreen.minimumTrackTintColor = .green.withAlphaComponent(CGFloat(sliderGreen.value))
    
        sliderBlue.minimumValue = 0
        sliderBlue.maximumValue = 1
        sliderBlue.value = 0.5
        labelBlue.text = String(sliderBlue.value.rounded())
        textFieldBlue.text = String(sliderBlue.value)
        sliderBlue.minimumTrackTintColor = .blue.withAlphaComponent(CGFloat(sliderBlue.value))
        
        
        
//    setup toolBar
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0,
                                              width: view.frame.size.width,
                                              height: 50))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: self,
                                            action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()
        textFieldRed.inputAccessoryView = toolBar
        textFieldGreen.inputAccessoryView = toolBar
        textFieldBlue.inputAccessoryView = toolBar
    }
    

    
    @objc private func didTapDone(){
        textFieldRed.resignFirstResponder()
        textFieldGreen.resignFirstResponder()
        textFieldBlue.resignFirstResponder()
        
        guard let redValue = textFieldRed.text, !redValue.isEmpty else{return}
      
        sliderRed.value = Float(redValue)!
        labelRed.text = String(format: "%.2f", sliderRed.value)
        changeColor()
        
        guard let greenValue = textFieldGreen.text, !greenValue.isEmpty else{return}
        sliderGreen.value = Float(greenValue)!
        labelGreen.text = String(format: "%.2f", sliderGreen.value)
        changeColor()
        
        guard let blueValue = textFieldBlue.text, !blueValue.isEmpty else{return}
        sliderBlue.value = Float(blueValue)!
        labelBlue.text = String(format: "%.2f", sliderBlue.value)
        changeColor()
        
    }
    
    @IBAction func changeRedColor() {
        labelRed.text = String(format: "%.2f", sliderRed.value)
        textFieldRed.text = String(format: "%.2f", sliderRed.value)
        sliderRed.minimumTrackTintColor = .red.withAlphaComponent(CGFloat(sliderRed.value))
        mainView.backgroundColor = sliderRed.minimumTrackTintColor
        changeColor()
    }
    
    @IBAction func changeGreenColor() {
        labelGreen.text = String(format: "%.2f", sliderGreen.value)
        textFieldGreen.text = String(format: "%.2f", sliderGreen.value)
        sliderGreen.minimumTrackTintColor = .green.withAlphaComponent(CGFloat(sliderGreen.value))
        mainView.backgroundColor = sliderGreen.minimumTrackTintColor
        changeColor()
    }
    
    @IBAction func changeBlueColor() {
        labelBlue.text = String(format: "%.2f", sliderBlue.value)
        textFieldBlue.text = String(format: "%.2f", sliderBlue.value)
        sliderBlue.minimumTrackTintColor = .blue.withAlphaComponent(CGFloat(sliderBlue.value))
        mainView.backgroundColor = sliderBlue.minimumTrackTintColor
        changeColor()
    }
    
    func changeColor() {
        mainView.backgroundColor = UIColor(red: CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1 )
    }
    
    
}

extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default) { _ in
            self.textFieldRed = nil
        }
        alert.addAction(okayAction)
        present(alert, animated:true)
    }
}
