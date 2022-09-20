import XCTest
@testable import SwiftDeepLTranslation

final class DeepLParameterTests: XCTestCase {
    
    func testParameterQuery() async throws {
        let parameter = DeepLParameter(target_lang: "EN", texts: ["language", "japanese"])
        XCTAssertEqual("target_lang=EN&text=language&text=japanese", parameter.query)
    }
}
