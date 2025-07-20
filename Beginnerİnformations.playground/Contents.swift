import UIKit
// değişecek bir veri ise "var"
// sabit ise "let"

let name = "Serif"
print(name)


// kod yukarıdan asagı aktıgı ıcın sabit değer tanımlamak en mantıklısı olacak

var height = 170
print(height)

height = 171
print(height)



//camel case : defaulsScore

let defaultScore = 100

var playerOne = defaultScore
var playerTwo = defaultScore


// Isımlendırme
// let sonuc = 15 cok tercih etme, ornek, toplamaSonucu daha iyi

/*
 
 
 */

var score1 = 3 * 8

// Compuond Assigment += , -= , /= , *=

let x=10
var y=15

y=20
print(y)

//converts yani Type Casting   Double(x), dönüşüm sadece yazıldıgı satır için gecerlidir.

// Mantıksal Operatorler
// == (eşit mi?)  ,  != (eşit değil mi?) , > , < , >= , <= ,  && , ! ,
	
// Bu iki yapı aynı yapıdır
var a=15
var b=5
var largest:Int

if a>b{
     largest=a
}	
else
{
     largest=b
}

print(largest)

largest = a > b ? a : b

print(largest)

// parametrsiz ve dönüişsüz
func displayPi(){
    print("3.14")
}
displayPi()

// parametreli ve dönüşsüz fonksiyonlar

func triple(value: Int){
    let result = value * 3
    print(result)
}

func triple(value2: String?) {
    guard let val = value2 else { return }
    if let value = value2 {
        print("Değer: \(value)")
    } else {
        print("boş değer gönderdin")
    }
    
}
triple(value: 10)
triple(value2: nil)
//Çoklu parametreli ve dönüşsüz

func multiply(firstNumber: Int, secondNumber: Int){
    let result2 = firstNumber * secondNumber
    print(result2)
}

multiply(firstNumber: 10, secondNumber: 20)
// Argument labels : Eğer değişken isminin anlamını kaybetmeden ve paramtereyi kullanırken farklı isimle kullanmak istiyorsak Argument labels kullanırız.

func sayHello(_ firstName: String){
    print("Merhaba" + " " + firstName )
}

func sayHello(to firstName: String){
    print("Merhaba" + " " + firstName)

}
sayHello(to: "Şerif")

func sayHello(to firstName: String, and AnotherName: String){
    print("Merhaba" + " " + firstName + " ve " + AnotherName)
}

sayHello(to: "Şerif", and: "Botan")



sayHello("ŞERİF")


func display(nameOfTeam: String, score: Int=0){
    let text = nameOfTeam + " " + String(score)
    print(text)
}
display(nameOfTeam: "Fenerbahce")
display(nameOfTeam: "Fenerbahce", score:10)

//Parametreli ve Dönüşlü Fonksiyonlar
func carpma(firstNumber: Int, secondNumber: Int) ->Int {
    let result = firstNumber * secondNumber
    return result // firstNumber * secondNumber ' da olabilir
    
}

carpma(firstNumber: 10, secondNumber: 20)

let dialog="""
    
    
    
"""

// \"
// \'
// \t

var myString = ""
if myString.isEmpty{
    
}

let C: Character = "b"

//Interpolation

var karsılamaMetni = ""
karsılamaMetni += "Merhaba"
karsılamaMetni += "Ben Serif"

let Name = "Serif"
let age = "24"


print("Merhaba, ben \(Name) ve \(age) yaşındayım")


Name.lowercased()
//suffix -- son kelime
//prefix -- ilk kelime
// contains -- içeriyor mu?
// count -- kelimenin harf sayısı nedir?

// Kendi veri tiplerimizi Struct larla oluşturabiliriz



/* enum Beden{
       case xsmall
       case small
       case large
} //string tanımlamalarında farklı yazımlarda hatanın onune geçer
*/

// mutating func == eğer değişkenin üstüne bir değer ekliyorsa bu şekilde tanımlanıyor
// will set birazdan calısacak değer, didset calısan değer(yeni deger gelmedenki değer)



struct OndalikSayi{
     var deger:Double = 3.14
}

var pi = OndalikSayi()










