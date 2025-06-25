//
//  NewViewController.swift
//  ViewControllerLifeCycle
//
//  Created by Şerif Botan Kapcuk on 25.06.2025.
//

import UIKit

class NewViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController - ViewDidLoad") 
    }
    override func viewWillAppear(_ animated: Bool) {
         // viewDidLoad'da hemen sonra calısan fonksiyondur
        // Sayfa ekrana her gelmek üzereyken çalışır
        // Kullanım örneği : Kullanıcının konumu güncelleyen bir sayfa ise her açıldığında o anki konumunu gunceller.
        super.viewWillAppear(animated)
        print("We will Appear")
    }
    override func viewDidAppear(_ animated: Bool) {
        // will appearden sonra calısan fonksiyondur
        // Sayfa her ekrana geldikten sonra çalışır birkaç saniye sonra
        // Kullanım örneği : Sayfa ekrana geldikten sonra bir süre sonra ekranda bildirim görmek istiyorsanız bu fonksiyonu kullanmanız gerekmektedir.
        // Animasyon ile çalışıyorsanız animasyonlar bu fonksiyon ile başlar veya uzun bir network request varsa bu fonksiyon ile başlar
        super.viewDidAppear(animated)
        print("We did appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        // Sayfa ekrandan gitmek uzere oldugu an calısır
        // Örnek : Navigation Controller'da başka bir sayfaya push edileceği zaman
        super.viewWillDisappear(animated)
        print("we will disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        //Bir viewcontroller'in hayat dongusundeki son calısan döngüdür. Sayfa ekrandan tamamen gittiği an calısır
        // Ornek : Çalmakta olan müziğin veya oynatılmakta olan bir videonun  yeni bir sayfaya geçerken durmak isterken bu fonksiyon calısacaktır
        super.viewDidDisappear(animated)
        print("we did disappear")
    }

}
