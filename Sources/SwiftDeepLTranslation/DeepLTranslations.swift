import Foundation

struct DeepLTranslation: Decodable {
    let detected_source_language: Language
    let text: String
}

struct DeepLTranslations: Decodable {
    let translations: [DeepLTranslation]
}
