import UIKit

class ViewController: UIViewController {
    
    struct WeatherResponse: Codable {
        let main: Main
        let weather: [Weather]
    }

    struct Main: Codable {
        let temp: Double
    }

    struct Weather: Codable {
        let description: String
    }
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var sicaklıkResult: UITextField!
    @IBOutlet weak var havaDurumuResult: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let apiKey = "3fb8728561abe479a2754c2caeb1cc2b"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Kullanıcının veri girmemesi için bu alanları pasifleştiriyoruz
        sicaklıkResult.isUserInteractionEnabled = false
        havaDurumuResult.isUserInteractionEnabled = false
    }

    @IBAction func getWeatherButtonTapped(_ sender: UIButton) {
        // Şehir ismini al
        guard let city = cityTextField.text?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              !city.isEmpty else {
            resultLabel.text = "Lütfen bir şehir ismi girin."
            return
        }
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            resultLabel.text = "URL hatalı."
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    self.resultLabel.text = "Hata oluştu: \(error.localizedDescription)"
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.resultLabel.text = "Veri alınamadı."
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(WeatherResponse.self, from: data)
                let temp = decodedData.main.temp
                let descriptionEN = decodedData.weather.first?.description ?? "Bilinmiyor"
                let descriptionTR = self.cevirAciklama(descriptionEN)
                
                DispatchQueue.main.async {
                    self.sicaklıkResult.text = "\(temp) °C"
                    self.havaDurumuResult.text = descriptionTR
                    self.resultLabel.text = "Başarıyla alındı."
                }
            } catch {
                DispatchQueue.main.async {
                    self.resultLabel.text = "Veri çözümlenemedi."
                }
            }
        }
        task.resume()
    }
    
    // İngilizce hava durumu açıklamasını Türkçeye çeviren fonksiyon
    func cevirAciklama(_ description: String) -> String {
        switch description.lowercased() {
        case "clear sky": return "Açık Gökyüzü"
        case "few clouds": return "Az Bulutlu"
        case "scattered clouds": return "Dağınık Bulutlar"
        case "broken clouds": return "Parçalı Bulutlar"
        case "shower rain": return "Sağanak Yağmur"
        case "rain": return "Yağmurlu"
        case "light rain": return "Hafif Yağmur"
        case "thunderstorm": return "Gök Gürültülü Fırtına"
        case "snow": return "Karlı"
        case "mist": return "Sisli"
        default: return description.capitalized // tanımlı değilse orijinalini yaz
        }
    }
}

