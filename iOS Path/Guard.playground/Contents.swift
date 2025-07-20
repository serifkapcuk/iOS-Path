import UIKit


func divide(_ number: Double, by divisor: Double ){
    guard divisor != 0  else{return}
    let result = number / divisor
    print(result)
}

divide(20, by: 4)

//Guard with optionals
struct Book{
    var title:String
    var price: Double
    var pages: Int
}
func processBook(title:String?, price:Double?, pages:Int?){
    guard let thetitle=title,let theprice=price, let thepages=pages else{return}
    let book1=Book(title: thetitle, price: theprice, pages: thepages)
}
// IF LET VE GUARD LET ARASINDAKİ TEMEL FARK BİRİ SÜSLÜ PARANTEZ İÇİNDE YAZILIR DİĞERİ SÜSLÜ PARANTEZ İÇİNDE OLMAK ZORUNDA DEĞİL.




// SCOPE VE SABİT DEĞİŞKENLER
// { İki süslü parantez arasındaki alan ismine Scope Denir }
// Global Scope
var name = "ŞERİF"
func printMyName(){
    // burada forun altındaki değişkeni kullanamayız
    for i in 1...15 {
        // burada printmyname scope içindeki değişkeni kullanabiliriz
    }
}
// fakat burada function içindeki değişkene ulaşamazsınız, cunku dış dunya o scope içindeki değişkeni göremez

// --------------------------------------------------

// Variable Shadowing
func complexScope(){
    let points = 100
    print(points)
    for index in 1...15{
        
        let points = 50
        print(points) // burada scope içindeki pointsi tanımlar, ama bu şekilde bir variable tanımlamasaydık üst scopedaki pointse ulaşıp onu yazdıracaktı
    }
}

// Iflet ve Guard letlerde shadowingi tercih etmeliyiz.
struct Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name //shadowing
        self.age = age // shadowing
    }
    
    
}

let emir = Person( name: "Emir",age:20)
print(emir.name)
print(emir.age)












