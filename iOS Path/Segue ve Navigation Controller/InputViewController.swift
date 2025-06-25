//
//  InputViewController.swift
//  Segue ve Navigation Controller
//
//  Created by Şerif Botan Kapcuk on 25.06.2025.
//

import UIKit

class InputViewController: UIViewController {
    
    
    @IBOutlet var textField : UITextField!
    @IBOutlet var segueSwitch: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonTapped(_ button: UIButton){
        
        if segueSwitch.isOn{
            performSegue(withIdentifier: "goNext", sender: nil) // koddan segue'yi calıstırabilmek için oluşturulan yapı ve segue'ye identifier eklenmeli, kod ile calısan segueler sayfadan segue eklemek gerekiyor, eğer butonla direk yapmak isteseydik butondan bağlardık segue'yi
        }
        else{
            
        }
        
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){ // data göndermek için kullanılan override function
        // segue.identifier  segue için tc kimlik no
        // segue.destination segue için gidilecek sayfa, birden fazla segue kullanırsak belirtmek zorunlu
         segue.destination.navigationItem.title = textField.text // gideceğin sayfanın title'ını güncellemiş oluyorsunuz
        
        
        
    }
    

    
}
