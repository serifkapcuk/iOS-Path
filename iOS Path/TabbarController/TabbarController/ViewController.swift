//
//  ViewController.swift
//  TabbarController
//
//  Created by Şerif Botan Kapcuk on 25.06.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Tabbardaki iteme bildirim eklemek istiyorsak "BADGE" kullanırız
        tabBarItem.badgeValue="350"
        tabBarItem.badgeColor = .green
        // badge valuesundan kurtulamak için nil'e eşitlemek gerekir
        // İmage tint hem yazıyı hem ikonun rengini değiştiriyor
        // Her viewcontroller başına bir tane navigation bar eklenirse eğer, her birinin bir tane hiyerarşisi yani her birinin bir tane title'i oluyor.
        
    }


}

