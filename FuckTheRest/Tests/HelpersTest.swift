//
//  HelpersTest.swift
//  FuckTheRest
//
//  Created by Fabrício Santos on 1/24/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import XCTest
@testable import FuckTheRest

class HelpersTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStringFromData()
    {
        let text = UUID().uuidString
        
        guard let data = text.data(using: .utf8) else {
            XCTFail("Fail to convert text to data")
            return
        }
        
        let resultTest = FuckingResult<Data>.success(200, data)
        let result = resultTest.map(extractStringFromData)

        switch result
        {
            case .success(_ , let value):
                if value != text {
                    XCTFail("Source information and Processed information are differents")
                }
            case .error( _ ):
                XCTFail("A not expected value appeared.")
        }
    }
    
}
