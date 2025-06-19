//
//  ViewController.swift
//  SecondProject
//
//  Created by Şerif Botan Kapcuk on 19.06.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lightTitle: UIButton!
    var lightOn = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonTapped(_ sender: UIButton){
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
}

