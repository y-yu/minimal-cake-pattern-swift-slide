import XCTest
@testable import MCPExample

class HashPasswordServiceTest: XCTestCase {
  // テスト用の実装を使う
  var sut: HashPasswordService = HashPasswordServiceTestImpl()
  
  func testHashBySha1() {
    XCTAssert(sut.hashBySha1("hoge") == "ba5b31f489676c1545a9f175867274c8c21b8f8b")
  }
}
