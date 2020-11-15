//
//  SpecialClassTests.swift
//  SwiftHookTests
//
//  Created by Yanni Wang on 15/11/20.
//  Copyright © 2020 Yanni. All rights reserved.
//

import XCTest
@testable import SwiftHook

/**
            SwiftHook               Aspects             Stinger             RXSwift             ReactiveCocoa
 NSURL:             Crash                   Crash                   Crash               Error                   Crash
 NSTimer:           Stuck                   Stuck                   Stuck                   -                           -
 Timer:                 Stuck                   Stuck                   Stuck               Error                   Stuck
 Timer.init():         Error                    Error                   Error                   Crash               Crash
 */

class SpecialClassTests: XCTestCase {

//    func testNSURL() throws {
//        let url = NSURL.init(string: "https://www.google.com")!
//        _ = try hookBefore(object: url, selector: #selector(getter: NSURL.host)) {
//            
//        }
//        let host = url.host
//    }
    
//    func testTimer() throws {
//        let timer = Timer.init(fire: Date.init(), interval: 1, repeats: false) { (_) in
//
//        }
//        _ = try hookBefore(object: timer, selector: #selector(getter: Timer.isValid)) {
//
//        }
//    }
    
    func testTimerNil() throws {
        do {
            let timer = Timer.init()
            _ = try hookBefore(object: timer, selector: #selector(getter: Timer.isValid)) {
            }
            XCTFail()
        } catch SwiftHookError.internalError(file: let file, line: let line) {
            XCTAssertTrue(file.hasSuffix("ParametersCheck.swift"))
            XCTAssertEqual(line, 25)
        } catch {
            XCTFail()
        }
    }

}
