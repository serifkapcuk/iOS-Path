import UIKit

class Person{
    var name: String
    init(name: String)
    {
        self.name = name
    }
    func sayHello(){
        print("Merhaba Ben \(name)")
    }
}

let person1=Person(name: "Serif")
print(person1.name)
person1.sayHello()


// Inherintance(Kalitim) -> Kümelendirme

class Vehicle{
    var CurrentSpeed = 0.0
    
    var Description: String{
        return("Araç \(CurrentSpeed) km hız ile yola devam ediyor")
    }
    func makeNoise(){
        
    }
    
}

let someVehicle=Vehicle()
print(someVehicle.Description)

// Subclass Oluşturmak

class Bicycle:Vehicle{
    var hasBasket = false
}
let biycyle1=Bicycle()
biycyle1.hasBasket=true;
biycyle1.CurrentSpeed=12
print("Biycyle \(biycyle1.Description) ")

// Override -> Methot ve özelliklerin yeniden yazılması
// Override yerine eski halini kullanmak istiyorsanız super. kelimesini kullanırsını

class Car: Vehicle{
    
    var geard = 1
    override var Description: String{
        return super.Description + " ve " + " \(geard) . vites ile yola devam ediyor"
    }
}
    
let car1 = Car()
car1.CurrentSpeed = 15
print(car1.Description)
    



