import UIKit

var names = ["Serif","Botan","Kapcuk"]
print(names)
if names.contains("Serif"){
    print("Evet Serif İsmi Var")
}
// let ile tanımlanan bir diziye eleman eklemenemez veya çıkarılamaz cunku let sabit bir yapısıdır

// Array Tipleri
// İçi boş array
var takipciler: [String] = []
var urunler = [String]() // Tercih Edilen Kullanım
var sifirlar = [Int](repeating: 0, count:5) // 5 tane 0 oluşturur

let nameCount = names.count
print(nameCount)

if names.isEmpty{
    print("Evet Boş")
}
else{
    print("Hayır Boş değil")
}

urunler[0] = "Ayakkabı"




