//
//  EstimatedViewController.swift
//  WeatherAppv2
//
//  Created by Şerif Botan Kapcuk on 7.07.2025.
//

import UIKit

class EstimatedViewController: UIViewController,UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyForecasts.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"ForecastTableCell") as? ForecastTableCell else { return UITableViewCell()}
        
        
        let forecast = dailyForecasts[indexPath.row]
        
        let date = Date(timeIntervalSince1970: TimeInterval(forecast.dt))
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let dayName = formatter.string(from: date)
        cell.dayLabel.text = translate(dayName)
        
        if let temp = forecast.main?.temp {
            cell.tempLabel.text = "\(temp)°C"
        } else {
            cell.tempLabel.text = "--°C"
        }
        
        return cell
    }
    
    
    let apiKey = "3fb8728561abe479a2754c2caeb1cc2b"
    
    var dailyForecasts: [Forecast] = []
    
    
    
    
    @IBOutlet var showForecastButton: UIButton!
    @IBOutlet var searchBarButton: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showForecastButton.layer.cornerRadius = 8
        showForecastButton.backgroundColor = .white
        searchBarButton.delegate = self
        searchBarButton.barTintColor = .clear
        searchBarButton.backgroundImage = UIImage()
        searchBarButton.isTranslucent = true
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "backgroundmorning")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        self.view.backgroundColor = UIColor(
            patternImage: backgroundImage.image ?? UIImage())
        updateBackgroundIamge()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    func updateBackgroundIamge(){
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
                
                
                
            } else {
                overrideUserInterfaceStyle = .dark
                let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
                backgroundImage.image = UIImage(named: "backgroundnight")
                backgroundImage.contentMode = .scaleAspectFill
                backgroundImage.clipsToBounds = true
                self.view.backgroundColor = UIColor(
                    patternImage: backgroundImage.image ?? UIImage()
                )
            }
        }
        
    }
    
    @IBAction  func buttonClicked(_ sender: UIButton) {
        guard let city = searchBarButton.text, !city.isEmpty else { return }
        let urlString = //"https://api.openweathermap.org/data/2.5/forecast/daily?q=\(city)&cnt=7&appid=\(apiKey)&units=metric"
        "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&cnt=40&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else { return }
        let task =  URLSession.shared.dataTask(with: url) {data,response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let forecastResponse = try decoder.decode(
                        ForecastResponse.self,
                        from: data
                    )
                    
                    
                    var filteredList: [Forecast] = []
                    var addedDays: [String] = []
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    
                    for item in forecastResponse.list {
                        let date = Date(timeIntervalSince1970: item.dt)
                        let dayString = dateFormatter.string(from: date)
                        
                        if !addedDays.contains(dayString) {
                            filteredList.append(item)
                            addedDays.append(dayString)
                            
                        }
                        if filteredList.count == 7 {
                            break
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.dailyForecasts = filteredList
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Decode hatası:", error)
                }
            }
        }
        task.resume()
    }
    
    
    func translate(_ description: String) -> String {
        switch description {
        case "Wednesday": return "Çarşamba"
        case "Thursday": return "Perşembe"
        case "Friday": return "Cuma"
        case "Saturday": return "Cumartesi"
        case "Sunday": return "Pazar"
        case "Monday": return "Pazartesi"
        case "Tuesday": return "Salı"
        default: return description.capitalized
        }
    }
    
}
