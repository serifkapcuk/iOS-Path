import UIKit

// Protocol
// Bir dizi fonksiyon ve değişkenlerde oluşturan bir şablondur.

//Swiftte var olan bazı protokoller;
//CustomStringCenvertable
//Equaltable
//Comperable
//Codable


// -------------------------------------
//CustomStringCenvertable
let string = "Hello World" // CustomStringCenvertable protocolunu destekliyor
print(string)
let number = 23 // CustomStringCenvertable protocolunu destekliyorprint(number)


struct Ayakkabı{  // CustomStringCenvertable protocolunu desteklemiyor
    var color: String
    var size:Double
}
let ayakkabi1 = Ayakkabı(color: "Siyah", size: 41.5)
print(ayakkabi1)


struct shoe: CustomStringConvertible{
    
    var color: String
    var size: Int
    
    
    var description: String /* customerStringConvertable protokolu ready-only değişken tanımlar  */
    {
        return "color: \(color), size: \(size)"
    }
}

let shoe1 = shoe(color: "Black", size: 41)
print(shoe1.description)


// -------------------------------------
//Equaltable Protokolü (Bilgi kıyaslaması yapmaya imkan sağlar)

struct Employee: Equatable {
    var firstName: String
    var lastName: String
    var jobTitle: String
    var phoneNumber: String
}

struct Company{
    var name:String
    var employees:[Employee]
}
// Uygulamaya giriş yapan kişi
let currentEmployee = Employee(firstName: "Şerif", lastName: "Kapcuk", jobTitle: "Junior", phoneNumber: "")

// Üstüne tıklanarak giriş yapılan kiş

let selectedEmployee = Employee(firstName: "Berkin", lastName: "Ceylan", jobTitle: "Content Directiro", phoneNumber: "")

// İki kişiyi kıyaslamalıyız ve eğer birbirlerine eşitse, kişi kendi bilgilerini düzenleyebilmeli.
// eğer eşit değilse, düzelt özelliği kapanmalı

if currentEmployee == selectedEmployee{
    print("Edit button on")
}
    else{
        print("Edit button off")
    }
    


// -------------------------------------
//Comparable Protokolü (Bilgi sıralaması)


struct Employee2: Equatable,Comparable  // Bunu tanımladıktan sonra kucuk eşittirde tanımlanıyor
{
    
    static func == (lhs: Employee2, rhs: Employee2) -> Bool {
        return  lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
    
    static func < (lhs: Employee2, rhs: Employee2) -> Bool {
        return lhs.lastName < rhs.lastName
    }
    
    var firstName: String
    var lastName: String
    var jobTitle: String
    var phoneNumber: String
}

let employee1 = Employee2(firstName: "isim1", lastName: "lastName1", jobTitle: "title1", phoneNumber: "phone1")
let employee2 = Employee2(firstName: "isim2", lastName: "lastName2", jobTitle: "title2", phoneNumber: "phone2")
let employee3 = Employee2(firstName: "isim3", lastName: "lastName3", jobTitle: "title3", phoneNumber: "phone3")
let employee4 = Employee2(firstName: "isim4", lastName: "lastName4", jobTitle: "title4", phoneNumber: "phone4")
let employee5 = Employee2(firstName: "isim5", lastName: "lastName5", jobTitle: "Jtitle5", phoneNumber: "phone5")

let x = [employee1,employee3,employee4,employee5,employee2]


let sortedEmployees = x .sorted(by: <)
for employee in sortedEmployees
{
    print(employee)
    
}
 



// -------------------------------------
//Codable Protokolü (Bilginin "Dictionary" formuna geçirilmesi)(key- value ikilileri)
struct Employee3: Equatable,Comparable,Codable // Bunu tanımladıktan sonra kucuk eşittirde tanımlanıyor
{
    
    
    var firstName: String
    var lastName: String
    var jobTitle: String
    var phoneNumber: String
    
    
    static func == (lhs: Employee3, rhs: Employee3) -> Bool {
        return  lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
    
    static func < (lhs: Employee3, rhs: Employee3) -> Bool {
        return lhs.lastName < rhs.lastName
    }
    
}
let bestEmployee = Employee3(firstName: "Şerif", lastName: "Kapcuk", jobTitle: "Junior", phoneNumber: "")
// Codable protokolunu destekleyen bir veri modelinin "Dictionary" formunda veri oluşturabilmesi için, jsonEncoder adı verilen bir lcass kullanılır.

let encode = JSONEncoder()
let jsonData = try! encode.encode(bestEmployee)
let jsonString = String(data: jsonData, encoding: .utf8)
print(jsonString)


// Protocol oluşturmak


// Bir değişkenin değerini veya fonksiyonun ne yaptığını Protokoller belirtmez. Yalnızca isim ve tür belirtirler. Get sadece okunabilir, get ve set hem okunabilir hem yazabilir
protocol  FullyNamed{
    var fullName: String { get }
    
    func sayFullName()
}
 
// : her zaman süper class anlamına gelmez
struct Person: FullyNamed{
    var firstName:String
    var lastName: String
    var fullName: String{
        
        return firstName + lastName
    }
    
    func sayFullName() {
        print(fullName)
    }
}

let person1 = Person(firstName: "Şerif", lastName: "Kapcuk")
print(person1)












