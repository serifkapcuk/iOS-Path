//
//  NewEmojiTableViewController.swift
//  TableView
//
//  Created by Şerif Botan Kapcuk on 27.06.2025.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    // Static table viewda arayuz elemanlarını direk view controllera atayabiliyoruz
    @IBOutlet var symbolTextField:UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextField:UITextField!
    @IBOutlet var usageTextField:UITextField!
    var emoji:Emoji?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Seçili olan rowdaki bilgiler edit sayfasına gelirken önce vieDidLoad fonksiyonun calısması gerekiyorki memorye bilgiler yüklensin.
        
        if let emoji = emoji{
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.descripton
            usageTextField.text = emoji.usage
        }
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender:Any?){
        //Yalnızca save unwind ise calısmaya devam etmeli
        
        
        guard segue.identifier == "saveUnwind" else{return}
        
        // Kullanıcının girdiği bilgiler
        
        let symbol = symbolTextField.text!
        let name = nameTextField.text!
        let description = descriptionTextField.text!
        let usage = usageTextField.text!
        
        // Girilen bilgilerle kulanıcı bir nesne oluşturur
        emoji = Emoji(symbol: symbol, name: name, descripton: description, usage: usage)
        
    }
    
}

