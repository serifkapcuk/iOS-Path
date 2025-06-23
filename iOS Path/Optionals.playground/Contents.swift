import UIKit

var greeting = "Hello, playground"

// gözle görülür ama içi boş string
var name: String=""

//gözle görünmüyor ama bir gün olacağı belli
var age:Int? // Memoryde yaşamıyor, ama bir gün yaşayabilir.
//Nil

//değer olmayışı = nil

var test: String?=nil
// ? >> olabilir veya olmayabilir
// olmayabilir (nil), olursa(String,int,bool vs)

struct Book{
    var name:String
    var publicationYear:Int?
    
}

let first = Book(name: "HarryPotter", publicationYear:1920)
let first2 = Book(name: "Book2", publicationYear:1920)
let first3 = Book(name: "Book3", publicationYear:nil)

// Optional olanların tipini belirlemek

var serverResponse = 404 // değeri nil olamayan bir tanımlama
var serverResponse2:Int?  // Bir veriyi direk nil'e de eşitlemeyezsiniz. example serverResponse = nil, yanlıs kullanım.
var serverResponse3 : Int? = 404 // Doğru tanımlama budur, şu anki değer 404 fakat yarın öbür gün nil'de olabilir

// Optional olan değerler ile çalışmak

// Bir değişkenin o anki değerinin nil olup olmadıgını nasıl kontrol edersiniz?
		
var publicationYear : Int?=2010

if publicationYear != nil{
    
    // nil değilmiş gibi kullanmak istiyorsak, değerin sonuna ! işareti koymamız gerekiyor. O an değer nil ise uygulama çökecek, o sebepten dolayı değerin, nil olup olmadıgını kontrol ettiririz.
    let actualYear = publicationYear!
    print(actualYear)
}

// IF - LET ( Bu yapı, yeni farklı bir değer oluşturabilmek yani değerin nil olmadığı durumlarda kullanılır)

if let actualYear = publicationYear{
    // publication year nil değilse , onun değerini '!' ile unwrap eder ve "actualYear" olarak sunar
    print(actualYear)
}

if let bookYear = first3.publicationYear{
    print("Book 3 publication years: \(bookYear)")
}

// IF-LET-ELSE
if let bookYear = first3.publicationYear{
    print("Book 3 publication years: \(bookYear)")
}
else{
    // eğer publication year nil ise işlenecek alan
}
// Fonksiyonlar ve Optionals (Optional değer dönen functionslar)
let string="1234"
let possiblenNumber = Int(string) // Bu değer bir optional değer döner, cunku her bir yazı tam bir sayıyı ifade etmez. Bu durumda sonuç nil olur


// Fonksiyon örneği
func printFullName(firstName:String, lastName:String, middleName:String?){
    if let middleName2=middleName{
        print("First Name: \(firstName), Second Name: \(middleName2), LastName: \(lastName)")
    }
    else{
        print("First Name: \(firstName),  LastName: \(lastName)")
    }
}

printFullName(firstName: "Şerif", lastName: "Kapcuk", middleName:nil)
printFullName(firstName: "Şerif", lastName: "Kapcuk", middleName:"Botan")



 // Failable Initiliazers(Inıtılıza edilemeyen objeler)

struct Cocuk{
    var name:String
    var monthsOld: Int
    
    init?(name: String, monthsOld: Int) {
        if monthsOld<12 || monthsOld>36{
            return nil

        }
        else{
        
            self.name=name
            self.monthsOld = monthsOld
        }
    }
}

let c1=Cocuk(name: "Burak", monthsOld: 45)
let c2=Cocuk(name: "Kaan", monthsOld: 18)


if let cocuk1=c1{
    //buraya girmez cunku c1 nil
}
if let cocuk2=c2{
    //buraya girer cunku c2 nil değil
    print(cocuk2.name , cocuk2.monthsOld)
}


 // Optional Chaining : Structlar arası nesnelerin, tek if let cümlesiyle ifade edilmesidir. example :
// if let apartmentNumber= person.residence?.address?.apartmentNumber?{}













 



    


























