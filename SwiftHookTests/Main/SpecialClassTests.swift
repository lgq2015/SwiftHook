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

class MyURL: NSURL {
    
}

class MyView: UIView {
    
}

class SpecialClassTests: XCTestCase {

    func testNSURL() throws {
        let url = MyURL.init(string: "https://www.google.com")!
//        _ = try hookBefore(object: url, selector: #selector(getter: NSURL.host)) {
//
//        }
//        object_setClass(url, MyURL.self)
        let host = url.host
        print("")
    }
    
    func testUIView() {
        let view = UIView.init(frame: CGRect.init(x: 11, y: 22, width: 33, height: 44))
        object_setClass(view, MyView.self)
        let frame = view.frame
        print("")
    }
    
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
