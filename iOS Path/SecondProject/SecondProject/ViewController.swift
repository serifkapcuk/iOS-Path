//
//  ViewController.swift
//  SecondProject
//
//  Created by Şerif Botan Kapcuk on 19.06.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lightTitle: UIButton!
    @IBOutlet var slider: UISlider!
    @IBOutlet var toggle: UISwitch!
    
    


    var lightOn = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonTapped(_ sender: UIButton){
        if toggle.isOn{
            print("Switch is on")
        }
        else
        {
            print("Switch is off")
        }
        lightOn.toggle()  // True ise False yapar, False ise True yapar
        updateUI()
        }
    func updateUI(){
        if lightOn{
            view.backgroundColor = .white
            lightTitle.setTitle("OFF", for: .normal)
        }
        else{
            view.backgroundColor = .black
            lightTitle.setTitle("ON", for: .normal)


        }
    }
    @IBAction func switchToggled(_ sender: UISwitch){
        
        if sender.isOn{
            print("Switch is on")
        }
        else{
            print("Switch is off")
        }
    }
    @IBAction func sliderValueChanged(_ slider: UISlider ){
        print(slider.value)
    }
    @IBAction func keyboardReturnKeyTapped(_ textfield: UITextField){
        if let text=textfield.text{
            print(text)
        }
        
    }
    @IBAction func textChanged(_ textField: UITextField){
        if let text = textField.text{
            print(text)
        }
    }
}

