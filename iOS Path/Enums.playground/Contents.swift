import UIKit

// Enum oluşturmak
// Not enum isimleri,Buyuk harfle başlar Sturctla oldugu gibi
// case isimleri kucuk harfle başlar
// Bir kere oluşturulan enumlara yeni case eklenemez. ONEMLI !!
enum Yon{
    case kuzey
    case guney
    case dogu
    case bati
}

enum Koltuk{
    case sag,orta,sol // Bu şekilde de yazılıyor ama cok tercih edilmez
}
var suankiYon = Yon.bati
print(suankiYon)
suankiYon = .dogu
print(suankiYon)

// Kontrol mekanizmalari ile Enum'ı kullanmak

switch suankiYon {
case .dogu:
    print("Dogu yonunde ilerliyorsunuz")
case .bati:
    print("Batı yönündesiniz")
case .kuzey:
    print("Kuzey yonunde ılerlıyorsunuz")
case .guney:
    print("Guney yönünde ilerliyorsunuz")
    
}
 






