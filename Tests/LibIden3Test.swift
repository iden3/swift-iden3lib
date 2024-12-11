import XCTest
@testable import LibIden3

final class LibIden3Test: XCTestCase {

    func testCleanCache() throws {
        let result = LibIden3.cleanCache()

        XCTAssertEqual(result, "")
    }
}
