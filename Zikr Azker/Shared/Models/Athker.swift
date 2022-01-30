//
//  AthkerModel.swift
//  Zikr Azker
//
//  Created by Yousra Ahmed on 18/12/2021.
//
/*
import Foundation

struct AthkarUI: Hashable, Identifiable{
//    static func == (lhs: AthkerUI, rhs: AthkerUI) -> Bool {
//        return (lhs.athkerRow.id == rhs.athkerRow.id)
//    }
    
    var id:Int //= UUID().uuidString
    var title:String
//    var athkerRow : English
//    var name:String
//    var thikr:String
    var iconName:String?
    var colorGradient:[UInt]?
}
*/
import Foundation

// MARK: - Welcome
struct Welcome: Codable { //all athkar
    let english: [English]

    enum CodingKeys: String, CodingKey {
        case english = "English"
    }
}

// MARK: - English
struct English: Codable, Identifiable, Hashable{
    let id: Int
    let title: String
    let audioURL: String
    let text: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title = "TITLE"
        case audioURL = "AUDIO_URL"
        case text = "TEXT"
    }
}
var name:String  = ""
// MARK: - Welcome
struct Condition: Decodable { //Athkar condition like morning and evening
    
    var zikr: [Zikr]?

    private struct CodingKeys: CodingKey {
        
        var intValue: Int?
        init?(intValue: Int) { self.intValue = intValue; self.stringValue = "\(intValue)" }
        
        var stringValue: String
        init?(stringValue: String) { self.stringValue = stringValue }

 //       static let name = CodingKeys.make(key: "Words of remembrance for morning and evening")
        static func make(key: String) -> CodingKeys {
            return CodingKeys(stringValue: key)!
        }
    }

    init(from coder: Decoder) throws {
        let container = try coder.container(keyedBy: CodingKeys.self)
      //  name = "Words of remembrance for morning and evening"//try container.decode(String.self, forKey: .name)
        self.zikr = try container.decode([Zikr].self, forKey: .make(key: name))
    }

//    enum CodingKeys: String, CodingKey {
//        case zikr = "Words of remembrance for morning and evening"
//    }
}

// MARK: - WordsOfRemembranceForMorningAndEvening
struct Zikr : Codable, Identifiable, Hashable  {
    let id: Int
    let arabicText, languageArabicTranslatedText, translatedText: String
    let repeatNum: Int
    let audio: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case arabicText = "ARABIC_TEXT"
        case languageArabicTranslatedText = "LANGUAGE_ARABIC_TRANSLATED_TEXT"
        case translatedText = "TRANSLATED_TEXT"
        case repeatNum = "REPEAT"
        case audio = "AUDIO"
    }
}


