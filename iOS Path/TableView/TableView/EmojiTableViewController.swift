//
//  EmojiTableViewController.swift
//  TableView
//
//  Created by Şerif Botan Kapcuk on 26.06.2025.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    let emojiler: [Emoji] = [
        Emoji(symbol: "😂", name: "Grining Face", descripton: "A typically smiley face", usage: "happiness"),
        Emoji(symbol: "😂", name: "Grining Face", descripton: "A typically smiley face", usage: "happiness"),
        Emoji(symbol: "😂", name: "Grining Face", descripton: "A typically smiley face", usage: "happiness"),
        Emoji(symbol: "😂", name: "Grining Face", descripton: "A typically smiley face", usage: "happiness"),
        Emoji(symbol: "😂", name: "Grining Face", descripton: "A typically smiley face", usage: "happiness"),
        Emoji(symbol: "😂", name: "Grining Face", descripton: "A typically smiley face", usage: "happiness"),
        Emoji(symbol: "😂", name: "Grining Face", descripton: "A typically smiley face", usage: "happiness"),
        Emoji(symbol: "😂", name: "Grining Face", descripton: "A typically smiley face", usage: "happiness"),
        Emoji(symbol: "😂", name: "Grining Face", descripton: "A typically smiley face", usage: "happiness"),

    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        //1 sectionunuz var ise bu fonksiyonu yazmanıza gerek yok varsayılan 1 zaten
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiler.count
        //Bu fonksiyon 1 kere calısıp bitmiyor, 4 sectiona sahip 1 yapı var ise, 4 section teker teker calısıtıgında her section calısırken gelecek
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Bir hücre ne zaman ekrana gelecekse cellForRowAt ile çizilir.
        // Bu fonksiyonun kaç kere calısacagı belli değildir, Kullanıcı scroll ettiği kadar calısır veya dizi elemanı kadar calısır.
        //Hücrenin sıralamasını vermek
        let emoji=emojiler[indexPath.row]
        
        // Storyboarddaki tanımlanan cell ile tanımak
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"EmojiCell")!
        
        //hücreyi data ile ayarlamak
        cell.textLabel?.text="\(emoji.symbol) - \(emoji.name)"
        cell.detailTextLabel?.text="\(emoji.descripton)"
        
        //olusturulan hucreyı return etmek
        return cell
        
    }
    
    // Mark -- Delegate fonksiyonları zorunlu değildir,  row üzerindeki actionları delegate üzerinde yaparız
    
    // Mark -- Action ( Burada butonlar ekleyip rowlar üzerinde işlemler yaptırabiliriz).
    
    
}
