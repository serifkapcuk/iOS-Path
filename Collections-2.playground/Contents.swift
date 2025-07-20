import UIKit

// İstenilen bir indeexe deger eklemek

var height=[1.40,1.70 ,1.60]
height.insert(1.80, at: 0 )
print(height)

// Arraydan eleman silmek
height.remove(at: 0)
print(height)
height.removeLast()
print(height)

//Dictionary Tanımlanması
var scores = ["Beşiktaş": 88, "Galatasaray": 89, "Fenerbahce":90]

var myDictionary=[String : Int]() // Boş Dictionary Tanımlanması

//Eski değerini almak

let fenerbahceninEskiDeğeri = scores.updateValue(91, forKey: "Fenerbahce") // Yeni değerini 91 olarak gunceller ve eski değerini "fenerbahceninEskiDeğeri değişkenine atar



for i in 1...5{
    print("Sayi: \(i)")
}
let names = ["Emirhan","Şerif","Botan"]

for name in names{
    print("1. isim : \(name)")
}

