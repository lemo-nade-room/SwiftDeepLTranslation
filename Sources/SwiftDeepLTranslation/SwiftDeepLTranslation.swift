import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct SwiftDeepLTranslation {
    
    public var key: String
    
    public static var API_URL = URL(string: "https://api-free.deepl.com/v2/translate")!
    
    public init(key: String) {
        self.key = key
    }
    
    public func translate(text: String, from: Language? = nil, to: Language) async -> String? {
        var result: DeepLTranslations
        do {
            result = try await fetch(texts: [text], from: from, to: to)
        } catch let error {
            if let translateError = error as? TranslateError {
                print(translateError.message)
            } else {
                print(error.localizedDescription)
            }
            return nil
        }
        guard result.translations.count == 1 else {
            if result.translations.count == 0 {
                print("翻訳結果が0個返された")
            } else {
                print("複数個の翻訳結果が返された")
            }
            return nil
        }
        return result.translations[0].text
    }
    
    public func translate(texts allTexts: [String], from: Language? = nil, to: Language) async throws -> [String] {
        var translations: DeepLTranslations = .init(translations: [])
        for texts in allTexts.texts {
            translations.append(try await fetch(texts: texts, from: from, to: to))
        }
        return translations.translations.map { $0.text }
    }
     
    func fetch(texts: [String], from: Language? = nil, to: Language) async throws -> DeepLTranslations {
        var request = URLRequest(url: Self.API_URL)
        request.httpMethod = "POST"
        request.setValue("DeepL-Auth-Key \(key)", forHTTPHeaderField: "Authorization")
        
        let parameter = DeepLParameter(target_lang: to.rawValue, source_lang: from?.rawValue, texts: texts)
        request.httpBody = parameter.query.data(using: .utf8)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw TranslateError(message: "HTTPURLResponse以外が返却された")
        }
        guard httpResponse.statusCode == 200 else {
            throw TranslateError(message: "status code: \(httpResponse.statusCode), message: \(String(data: data, encoding: .utf8) ?? "")")
        }
        return try JSONDecoder().decode(DeepLTranslations.self, from: data)
    }
    
}
