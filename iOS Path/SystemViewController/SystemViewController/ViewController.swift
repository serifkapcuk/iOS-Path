//
//  ViewController.swift
//  SystemViewController
//
//  Created by Şerif Botan Kapcuk on 30.06.2025.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIPickerViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate,MFMailComposeViewControllerDelegate {
    
    

    
    
    @IBOutlet  var imageView:UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    // Bu fonksiyon, UIImage view alanından bir fotoğraf seçtiğinde veya çekildiğinde çalışır
        
        // Info bir directionary'dir ve seçilen medyanın kendisinin ve hakkında detaylı bilgi verir
        // Dictionary içerisinde seçilen görsele ulaşır
        guard let selectedImage = info[.originalImage] as? UIImage else{
            return
        }
        // seçilen görseli imageView'a aktarmak
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareButtonTapped(_ button:UIButton){
        //Ekranda bulunan imageView da bir görsel var mı emin oluyoruz.
        guard let image = imageView.image else{return}
        
        // Adım 1 : Activity Controller nesnesi olustur.
        // Paylaşılacak olan nesneler herhangi bir değer de olabilir(String, int,double vs)
        // ApplicationActivities : Paylaşılan nesne hangi platformlarda paylaşılacak (Twitter, instagram,reddit vs)
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil  )
        
        //Bulundugunuz Controllerda yeni bir controller göstermek için kullanılır
        // Activity controllerDa fotoğrafı savelemek için, info p listten izin vermeniz gerekmektedir. (privacy photo addition library)
    
        present(activityController, animated: true, completion: nil)
            }
    @IBAction func safariButtonTapped(_ button:UIButton){
        if let url = URL(string: "https://google.com"){
            let safariController = SFSafariViewController(url: url)
            present(safariController, animated: true, completion: nil)
        }
        
    }
    @IBAction func cameraButtonTapped(_ button:UIButton){
        
        let imagePickerController = UIImagePickerController()

        
        // ImageViewControllerin yonetıcısının bu viewController oldugunu belirtir.
        // Eğer belirtilmezse pickertController çalışmayacktır
        imagePickerController.delegate = self
        
        
        
        
        // action sheet : ekranın altından gelen sayfa görunumlu
        // alert ise : ekrana gelen pop up!
        
        //Adım 1 : Alert Controller oluşturmak
        let alertController = UIAlertController(title: "Görsel Kaynağı Seçin", message: nil, preferredStyle: .actionSheet)
        
        //   Adım 2 : Aksiyonları oluşturmak
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let cameraAction = UIAlertAction(title: "Kamera", style: .default) { (action) in
            print("Kamera")
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)

        }
        let photoLibrary = UIAlertAction(title: "Fotoğraf Galerisi", style: .default){(action) in
            print("Fotoğraf Galerisi")
            imagePickerController.sourceType = .photoLibrary // Image pickerin eklendiğini gösterir
            self.present(imagePickerController, animated: true, completion: nil)
        }
        
        
        // Adım 3 oluşturulan aksiyonları controllera eklemek gerekiyor
        alertController.addAction( cancelAction)
        alertController.addAction( cameraAction)
        alertController.addAction( photoLibrary)

        // Adım 4 : controllerların ekranda gösterilmesi
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func emailButtonTapped(_ button:UIButton){
        // Öncelikle mailin atılıp atılmayacak bir ortamda oldugunu kontrol etmen gerekir.
        // Simulatorler mail atamaz, uygulamanızın çökememesini sağlamanız gerekmektedir.
        guard  MFMailComposeViewController.canSendMail() else{return}
        
        // Adım1 Controller olusturmak
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setCcRecipients(["seriffkapcuk@gmail.com"])
        mailComposer.setSubject("Ekibinize Dahil Olmak İstiyorum Alın Beni")
        mailComposer.setMessageBody("Selamlar nasılsınız?", isHTML: false)
        
        present(mailComposer, animated: true, completion: nil)
    }

}

