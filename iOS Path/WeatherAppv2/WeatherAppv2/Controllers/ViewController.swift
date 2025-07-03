//
//  ViewController.swift
//  WeatherAppv2
//
//  Created by Şerif Botan Kapcuk on 2.07.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet  var tempResultTextField: UITextField!
    @IBOutlet  var windSpeedLabel: UILabel!
    @IBOutlet  var directionOfWind: UILabel!
    @IBOutlet  var searchButton:UISearchBar!

    
    
    let apiKey = "3fb8728561abe479a2754c2caeb1cc2b"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempResultTextField.isUserInteractionEnabled = false
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "background")
            backgroundImage.contentMode = .scaleAspectFill
            backgroundImage.clipsToBounds = true

            self.view.insertSubview(backgroundImage, at: 0)
        
    }
    
    @IBAction  func showButtonTapped(_ sender:UIButton){
        
        guard let city = searchButton?.text, !city.isEmpty else{ return }
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                print("Hata Oluştu")
                return
            }
            
            guard let data = data else {
                print("Veri alınamadı")
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(WeatherResponse.self, from: data)
                let temp = decodedData.main.temp
                let wind = decodedData.wind.speed
                let direction = decodedData.wind.deg
                
                DispatchQueue.main.async {
                    self.tempResultTextField.text = "\(temp) °C"
                    self.windSpeedLabel.text = "\(wind) m/s"
                    self.directionOfWind.text="\(direction)"
                    print("Veri Başarı ile alındı") }
            } catch {
                DispatchQueue.main.async {
                    print("Veri Çözümlenemedi")
                }
            }
        }
        task.resume()
    }
    
    
}

