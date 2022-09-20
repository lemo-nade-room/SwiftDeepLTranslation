import XCTest
@testable import SwiftDeepLTranslation

final class SwiftDeepLTranslationTests: XCTestCase {
    
    static let translation = SwiftDeepLTranslation(key: "abcdefghijklmnopqrstuvwxyz:fx")
    
    func testAPIKey() throws {
        let translation = SwiftDeepLTranslation(key: "hello")
        XCTAssertEqual("hello", translation.key)
    }
    
    func testTranslate() async throws {
        let result = await Self.translation.translate(text: "language", to: .Japanese)
        XCTAssertEqual("言語", result)
    }
    
    func testMultiTranslate() async throws {
        let result = try await Self.translation.translate(texts: ["language", "japanese"], to: .Japanese)
        XCTAssertEqual(["言語", "ジャパニーズ"],  result)
    }
    
}
