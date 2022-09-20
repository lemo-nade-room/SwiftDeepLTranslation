import Foundation

struct DeepLTranslation: Decodable {
    let detected_source_language: Language
    let text: String
}

struct DeepLTranslations: Decodable {
    
    let translations: [DeepLTranslation]
    
    mutating func append(_ added: Self) {
        self =  .init(translations: translations + added.translations)
    }
}
