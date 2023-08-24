//
//  TwitterAppTests.swift
//  TwitterAppTests
//
//  Created by 菊地原杏菜 on 2023/07/22.
//

import XCTest
@testable import TwitterApp

final class TwitterAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCheckCharacterLimit() throws {
        let vc = EditorViewController()
        let result = vc.checkCharacterLimit(textCount: 141)
        XCTAssertFalse(result)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
