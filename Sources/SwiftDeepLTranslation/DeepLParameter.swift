import Foundation

struct DeepLParameter {
    
    var target_lang: String
    
    var source_lang: String?
    
    var texts: [String]
    
    var query: String {
        var items = [URLQueryItem]()
        items.append(URLQueryItem(name: "target_lang", value: target_lang))
        if let source_lang = source_lang {
            items.append(URLQueryItem(name: "source_lang", value: source_lang))
        }
        for text in texts {
            items.append(URLQueryItem(name: "text", value: text))
        }
        var components = URLComponents()
        components.queryItems = items
        
        let queryString = components.string!
        return String(queryString.suffix(queryString.count - 1))
    }
}
