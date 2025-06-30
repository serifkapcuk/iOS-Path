import UIKit

//Codable ' ı desteklemek demek hemen encodeble'ı hem decodeble'ı destekelemek demektir


struct Note: Codable {
    var title:String
    var text:String
    var timeStamp:Date // Notun ne zaman oluşturuldugunu gösterir
    
}

// -> Date : O an demek
let newNote = Note(title: "Alışverişte alınacaklar", text: "Yoğurt,çay,süt almayı unutma", timeStamp: Date())

// Bir note nesnesinin,'plist' (propertyList) formatına encode edilmesi
// Elinizdeki bir veriyi, hafızaya kaydetmek istiyorsanız onu data formatına encode etmeniz gerekmektedir
// Encode dosya formatlarına örnek : Json,Plist,mp3,mp4

// Bu encodable protokulunu destekleyen herhangi bir data formuna encode eder.
let propertyListEncoder = PropertyListEncoder()

// program çalışırken error fırlatabilir, yani throwing function



// Yöntem 1 : Fonksiyon calıstıgı esnada karşılaşan hataları yakalamak isterseniz
do{
    let data = try propertyListEncoder.encode(newNote)
}
catch{
    // Size error adından bir değişken verir
    // Bu error, do blogu içinde calısırken bir hata meydana gelirkenki hataları belirtir
    print(error)
}

// Yöntem 2 : Hatanın bir önemi yok ,yalnızca nil olmadıgı durumu arıyorsanız

if let data = try? propertyListEncoder.encode(newNote)
{
    print(data)
}


// DECODING

if let data = try? propertyListEncoder.encode(newNote)
{
    let propertyListeDecoder = PropertyListDecoder()
    if let decoderData = try? propertyListeDecoder.decode(Note.self, from: data){
         print("Decoded Data")
         print(decoderData)
    }
}
// FILEMANGER ILE DOCUMENT DIRECTORY KULLANIMI

// Her uygulamanın kendi document direcory'si var
//  Uygulamalar,yalnızca kendi klasorune veri yazabilir veya okuyabilir
// Uygulamanın dışında bir veriye ulaşmak istendiginde bu durum mutlaka kullanıcıya bir alert ile bildirilir.


// Bir projenin birden fazla document directory'si olabilir, Fakat varsayılan olarak yalnızca 1 tane oluşturur.
// Bu nedenle document directory bir arraydir ve biz arrayın birinci elemanına ulaşırız
let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
 
print(documentDirectory)

//"documentDirectory" size bir klasor verir, Bu klasor ıcındekı yeni dosya uzantısı oluşturmamız gerekiyor
// .../.../documents/notes.plist
let acrhieveURL = documentDirectory.appendingPathComponent("notes").appendingPathExtension("plist")
print(acrhieveURL)


// OLUŞTURDUGMUZ PATHE DATA YAZMAK(ENCODE EDILMIS DATANIN HAFIZAYA EKLENMESİ)


if let data = try? propertyListEncoder.encode(newNote){
    // NoFile Protection : Var olan dosyanın üzerine yazılmasını engellemez
    
    // Datanın belirtilenen bir URL'e yazılmasını sağlar
    print("Writing File")
    try? data.write(to: acrhieveURL, options: .noFileProtection)
}


// ENCODE EDILEN DATAYI OKUMAK

// Datanın özel bir initi vardır
// Data(ContentsOf: ) -> Parametre olarak vereceğiniz URL'de  bulunan datayı kullanarak initiliaze edilmesini sağlar.
let propertyListDecoder = PropertyListDecoder()

// Adım 1 : Dosyayı Data formatında okumak.
if let retreivedData = try? Data(contentsOf: acrhieveURL){
    // Adım 2 propertyListDecoder kullanarak note objesi oluşturmak
    if let decodedNote = try? propertyListDecoder.decode(Note.self, from: retreivedData){
        print(decodedNote)
    }
}


// ARRAY TÜRÜNDEN VERİ KAYDETMEK

let note1 = Note(title: "Note 1", text: "This is note 1", timeStamp: Date())
let note2 = Note(title: "Note 2", text: "This is note 2", timeStamp: Date())
let notes=[note1,note2]

let notesURL = documentDirectory.appendingPathComponent("notes").appendingPathExtension("plist")

if let encodedData = try? propertyListEncoder.encode(notes){
    try? encodedData.write(to: notesURL, options: .noFileProtection)
    print("Array Eklendi")
}

// Array Tipindeki Veriyi Okumak

if let notesData = try? Data(contentsOf: notesURL)
{
    if let decodedNotes = try? propertyListDecoder.decode([Note].self, from: notesData){
        print(decodedNotes)
    }
}


