//
//  ViewController.swift
//  WeatherAppv2
//
//  Created by Şerif Botan Kapcuk on 2.07.2025.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate{
    
    
    @IBOutlet  var tempResultLabel: UILabel!
    @IBOutlet  var windSpeedLabel: UILabel!
    @IBOutlet  var directionOfWind: UILabel!
    @IBOutlet  var searchButton: UISearchBar!
    @IBOutlet  var showButton: UIButton!
    @IBOutlet  var locationButton:UIButton!
    
    let locationManager = CLLocationManager()
    
    
    let apiKey = "3fb8728561abe479a2754c2caeb1cc2b"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBackGround()
        searchButton.placeholder = "Bir şehir gir!"
        searchButton.barTintColor = .clear
        searchButton.backgroundImage = UIImage()
        locationManager.delegate = self
        
    }
    @IBAction func requestLocationTapped(_ sender: UIButton) {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
    }
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let status = locations.first {
            let lat = status.coordinate.latitude
            let lon = status.coordinate.longitude
            print("Latitude is: \(lat), Langitude is: \(lon)")
            getWeatherCoordinate(lat: lat, lon: lon)
            
            
        } else{return}
    }
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        print("Konum alınamadı: \(error.localizedDescription)")
    }
    
    
    func updateBackGround() {
        
        let now = Date()
        let calendar = Calendar.current
        var components = calendar.dateComponents(
            [.year, .month, .day],
            from: now
        )
        components.hour = 18
        
        components.minute = 00
        if let comparison = calendar.date(from: components){
            if now < comparison{
                overrideUserInterfaceStyle = .light
                let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
                backgroundImage.image = UIImage(named: "backgroundmorning")
                backgroundImage.contentMode = .scaleAspectFill
                backgroundImage.clipsToBounds = true
                self.view.backgroundColor = UIColor(
                    patternImage: backgroundImage.image ?? UIImage()
                )
                showButton.backgroundColor = .blue
                showButton.tintColor = .white
                showButton.layer.cornerRadius = 8
                locationButton.layer.cornerRadius = 8
                
                
            } else {
                overrideUserInterfaceStyle = .dark
                let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
                backgroundImage.image = UIImage(named: "backgroundnight")
                backgroundImage.contentMode = .scaleAspectFill
                backgroundImage.clipsToBounds = true
                self.view.backgroundColor = UIColor(
                    patternImage: backgroundImage.image ?? UIImage()
                )
                showButton.tintColor = .white
                locationButton.tintColor = .white
                locationButton.layer.cornerRadius = 8
                
                
                
            }
        }
    }
    
    @IBAction  func showButtonTapped(_ sender:UIButton) {
        
        guard let city = searchButton?.text, !city.isEmpty else{ return }
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(
            with: url
        ) {
 data,
 response,
 error in
            
            if error != nil {
                print("Hata Oluştu")
                return
            }
            
            guard let data = data else {
                print("Veri alınamadı")
                return
            }
            do {
                let decodedData = try? JSONDecoder().decode(
                    WeatherResponse.self,
                    from :data
                )
                guard let temp = decodedData?.main?.temp,
                      let wind = decodedData?.wind?.speed,
                      let direction = decodedData?.wind?.deg else { return }
                if temp > 15.00{
                    DispatchQueue.main.async {
                        
                        let backgroundImage = UIImageView(
                            frame: UIScreen.main.bounds
                        )
                        backgroundImage.image = UIImage(named: "sunnyimage")
                        backgroundImage.contentMode = .scaleAspectFill
                        backgroundImage.clipsToBounds = true
                        
                        self.view.backgroundColor = UIColor(
                        patternImage: backgroundImage.image ?? UIImage()
                        )
                    }
                    
                    
                }
                else if temp < 15.00 {
                    DispatchQueue.main.async {
                        let backgroundImage = UIImageView(
                            frame: UIScreen.main.bounds
                        )
                        backgroundImage.image = UIImage(named: "coldimage")
                        backgroundImage.contentMode = .scaleAspectFill
                        backgroundImage.clipsToBounds = true
                        self.view.backgroundColor = UIColor(
                        patternImage: backgroundImage.image ?? UIImage()
                        )
                    }
                }
                
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
    
    func getWeatherCoordinate(lat:Double,lon:Double) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(
            with: url
        ) {
 data,
 response,
 error in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Veri alınamadı")
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(
                    WeatherResponse.self,
                    from: data
                )
                
                guard let temp = decodedData.main?.temp,
                      let wind = decodedData.wind?.speed,
                      let direction = decodedData.wind?.deg else { return }
                if temp > 15.00{
                    DispatchQueue.main.async {
                        
                        let backgroundImage = UIImageView(
                            frame: UIScreen.main.bounds
                        )
                        backgroundImage.image = UIImage(named: "sunnyimage")
                        backgroundImage.contentMode = .scaleAspectFill
                        backgroundImage.clipsToBounds = true
                        self.view.backgroundColor = UIColor(
                            patternImage: backgroundImage.image ?? UIImage()
                        )
                    }
                }
                else if temp < 15.00 {
                    DispatchQueue.main.async {
                        let backgroundImage = UIImageView(
                            frame: UIScreen.main.bounds
                        )
                        backgroundImage.image = UIImage(named: "coldimage")
                        backgroundImage.contentMode = .scaleAspectFill
                        backgroundImage.clipsToBounds = true
                        self.view.backgroundColor = UIColor(
                            patternImage: backgroundImage.image ?? UIImage()
                        )
                    }
                }
                
                DispatchQueue.main.async {
                    self.tempResultLabel.text = "\(temp) °C"
                    self.windSpeedLabel.text = "\(wind) m/s"
                    self.directionOfWind.text = "\(direction)"
                    print("Konuma göre hava durumu gösterildi ")
                }
            } catch {
                print("Decoding hatası: \(error)")
            }
        }
        
        task.resume()
        
    }
    
}
