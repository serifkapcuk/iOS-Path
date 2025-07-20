import UIKit

var greeting = "Hello, playground"

// Tip Donusumleri
// pet as? Dog
// pet as? Cat


class Animal{
    
}
class cat : Animal{}
class Dog : Animal{}
class bird : Animal{}

// Eğer bir arrayda birden farklı veri tipi aynı anda kullanabiliyorsa o Array'in veri tipi ne?

//----------------------------------------------//
// Any Anahtarı Kelimesi
// Any >> Her türlü veri tipi olabilir

var array : [Any] = [5,"Can",4.78,Dog()]

if let firsItem = array[0] as? Int{
    print(firsItem)
}






