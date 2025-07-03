//
//  ViewController.swift
//  WeatherAppv2
//
//  Created by Şerif Botan Kapcuk on 2.07.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet  var tempResultLabel:UILabel!
    @IBOutlet  var windSpeedLabel:UILabel!
    @IBOutlet  var directionOfWind:UILabel!
    @IBOutlet  var searchButton:UISearchBar!
    @IBOutlet  var showButton:UIButton!

    let apiKey = "3fb8728561abe479a2754c2caeb1cc2b"

    override func viewDidLoad(){
        super.viewDidLoad()
        updateBackGround()
        searchButton.placeholder = "Bir şehir gir!"
        searchButton.barTintColor = .clear
        searchButton.backgroundImage = UIImage()
    }
    
    func updateBackGround(){
        
        let now = Date()
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: now)
        components.hour = 13
        components.minute = 00
        if let comparison = calendar.date(from: components){
            if now < comparison{
                overrideUserInterfaceStyle = .light
                let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
                backgroundImage.image = UIImage(named: "backgroundmorning")
                backgroundImage.contentMode = .scaleAspectFill
                backgroundImage.clipsToBounds = true
                self.view.insertSubview(backgroundImage, at: 0)
                showButton.backgroundColor = .lightGray
            } else {
                overrideUserInterfaceStyle = .dark
                let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
                backgroundImage.image = UIImage(named: "backgroundnight")
                backgroundImage.contentMode = .scaleAspectFill
                backgroundImage.clipsToBounds = true
                self.view.insertSubview(backgroundImage, at: 0)
            }
        }
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
                    self.tempResultLabel.text = "\(temp) °C"
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

