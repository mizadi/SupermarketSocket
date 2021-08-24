//
//  SupermarketTests.swift
//  SupermarketTests
//
//  Created by Adi Mizrahi on 09/08/2021.
//

import XCTest
@testable import Supermarket
class SupermarketTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    // check if the name is actaully equal to it's relevant field
    func testParser() {
        let goodResult: Any = """
                            {"name": "Blueberries", "bagColor": "#835322", "weight": "1.4kg"}
                            """
        let missingFieldResult: Any = """
                            {"name": "Blueberries", "bagColor": "#835322"}
                            """
        let missingTwoFieldsResult = """
                            {"name": "Blueberries"}
                            """
        let emptyResult = ""
        let badResult: Any = 1
        let nilResult: Any? = nil
        XCTAssertNotNil(SupermarketProductParser.parse(goodResult))
        XCTAssertNil(SupermarketProductParser.parse(badResult))
        XCTAssertNil(SupermarketProductParser.parse(missingFieldResult))
        XCTAssertNil(SupermarketProductParser.parse(emptyResult))
        XCTAssertNil(SupermarketProductParser.parse(missingTwoFieldsResult))
        XCTAssertNil(SupermarketProductParser.parse(nilResult))
    }
    
}
