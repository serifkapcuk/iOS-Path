//
//  EmojiTableViewController.swift
//  TableView
//
//  Created by Şerif Botan Kapcuk on 26.06.2025.
// Rowlar arasındaki aralıgı arttırmak için, table view'i seçeriz ve row heihghti automatic yerine manual istediğimiz sayıyı veririz


import UIKit

class EmojiTableViewController: UITableViewController {
   
    var emojiler: [Emoji] = [
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
    
        let cell = tableView.dequeueReusableCell(withIdentifier:"EmojiCell") as! EmojiTableViewCell
        
        cell.update(with: emoji)
        //olusturulan hucreyı return etmek
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewControllerSegue"{
            // O an seçili olan hucrenın IndexPath 	değerini verir
            	let selectedIndexPath = tableView.indexPathForSelectedRow!
            
            // O an seçili olan rowdaki emojilerin nesnesine ulasır
            
            let selectedEmoji = emojiler[selectedIndexPath.row]
            // seguenin storyboardda bağlı olan navigaionController
            
            let navigationController = segue.destination as! UINavigationController
            
            // Navigation controllera baglanan top sayfaya ulasır
            
            let editEmojiController = navigationController.topViewController as! NewEmojiTableViewController
            
            editEmojiController.emoji=selectedEmoji
            
            
            
        }
    }
    override func tableView(_ tableView :UITableView, commit editingStyle:UITableViewCell.EditingStyle, forRowAt indexPath:IndexPath){
        // İndex Path : Editing hücrenin gerçekleştiği hücrenin konumu, editingstyle : delete veya add yani yapılacak aksiyon
        if editingStyle == .delete{
            // Adım 1 : Emojis arryinden indexPath.row'da bulunan objeyi sil
            emojiler.remove(at: indexPath.row)
        }
        // tableview'e sil dememiz gerekiyor
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
    }
    // Seçilen cell, kaydırılarak yer değiştirir
    override func tableView(_ tableView:UITableView, didSelectRowAt indexPath:IndexPath){
        let selectedEmoji = emojiler[indexPath.row]
        performSegue(withIdentifier:"viewControllerSegue", sender: nil)
        print("\(selectedEmoji.symbol) \(indexPath)")
    }
    
    
    @IBAction func editButtonTapped(_ button: UIBarButtonItem){
        let tableViewEdittingMode = tableView.isEditing
        tableView.setEditing(!tableViewEdittingMode, animated: true)
    }
    
    // Mak -- Delegate fonksiyonları zorunlu değildir,  row üzerindeki actionları delegate üzerinde yaparız
    
    // Mark -- Action ( Burada butonlar ekleyip rowlar üzerinde işlemler yaptırabiliriz).
    
    
    // New emoji sayfasından EmojiTableViewController ekranına geçmek için kullanılan function
    
    
    
    
    
    @IBAction func unwindFromNewEmoji (_ segue:UIStoryboardSegue){
        guard segue.identifier=="saveUnwind",
              let sourceViewController = segue.source as? NewEmojiTableViewController,
              let newEmoji = sourceViewController.emoji     else {return}
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow{
            // Daha önceden bir hücre seçilmiş
            emojiler[selectedIndexPath.row] = newEmoji
            
            
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        }
        else {
            // Yeni bir emoji eklenmiş
       
        
        // Adım 1 , yeni emoji objesini "emojiler" arrayıne ekle
        emojiler.append(newEmoji)
        
        // Yeni bir hücre için indexPath oluştur
        let newIndexPath = IndexPath(row: emojiler.count, section: 0)
        
        //Oluşturulan indexPath için TableView'a yeni bir hücre eklenir
        tableView.insertRows(at: [newIndexPath], with: .automatic)
        
        }
        
        
    }
    
}
