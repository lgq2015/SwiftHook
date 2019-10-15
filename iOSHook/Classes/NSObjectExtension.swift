//
//  NSObjectExtension.swift
//  iOSHook
//
//  Created by Yanni Wang on 2/10/19.
//  Copyright © 2019 Yanni. All rights reserved.
//

import Foundation

public extension NSObject {
        
    // before
    @discardableResult
    func hookBefore(selector: Selector,
                    onlyOnce: Bool = false,
                    error: inout Error?,
                    block: (_ obj: NSObject, _ args: [Any]) -> Void) -> Token? {
        var token: Token? = nil
        performLocked {
            guard isSelectorAllowedForOneInstance(obj: self, selector: selector, error: &error) else {
                return
            }
            token = Token()
        }
        return token
    }
    
    @discardableResult
    class func hookBeforeForAllInstances(selector: Selector,
                                         onlyOnce: Bool = false,
                                         error: inout Error?,
                                         block: (_ obj: NSObject, _ args: [Any]) -> Void) -> Token? {
        var token: Token? = nil
        performLocked {
            guard isSelectorAllowedForAllInstances(theClass: self, selector: selector, error: &error) else {
                return
            }
            token = Token()
        }
        return token
    }
    
    @discardableResult
    class func hookBeforeForClass(selector: Selector,
                                  onlyOnce: Bool = false,
                                  error: inout Error?,
                                  block: (_ class: AnyClass, _ args: [Any]) -> Void) -> Token? {
        var token: Token? = nil
        performLocked {
            guard isSelectorAllowedForClass(theClass: self, selector: selector, error: &error) else {
                return
            }
            token = Token()
        }
        return token
    }
    
    // after
//    @discardableResult
//    func hookAfter(selector: Selector,
//                   onlyOnce: Bool = false,
//                   error: AutoreleasingUnsafeMutablePointer<Error>? = nil,
//                   block: (_ obj: NSObject, _ result: Any, _ args: [Any]) -> Void) -> Token? {
//        var token: Token? = nil
//        performLocked {
//            guard let `class` = object_getClass(self),
//                isSelectorAllowed(class: `class`, selector: selector, error: error) else {
//                    return
//            }
//            token = Token()
//        }
//        return token
//    }
    
    // instead
//    @discardableResult
//    func hookInstead<ReturnType>(selector: Selector,
//                                 onlyOnce: Bool = false,
//                                 error: AutoreleasingUnsafeMutablePointer<Error>? = nil,
//                                 block: (_ obj: NSObject, _ origin: (_ args: [Any]) -> ReturnType, _ args: [Any]) -> ReturnType) -> Token? {
//        var token: Token? = nil
//        performLocked {
//            guard let `class` = object_getClass(self),
//                isSelectorAllowed(class: `class`, selector: selector, error: error) else {
//                    return
//            }
//            token = Token()
//        }
//        return token
//    }
    
//    // before dealloc
//    func hookBeforeDealloc(error: AutoreleasingUnsafeMutablePointer<Error>? = nil,
//                           block: (_ obj: NSObject) -> Void) {
//        performLocked {
//
//        }
//    }
//
//    // after dealloc
//    func hookAfterDealloc(error: AutoreleasingUnsafeMutablePointer<Error>? = nil,
//                          block: () -> Void) {
//        performLocked {
//
//        }
//    }
    
    // class
    
    // before
    
    
    // after
//    @discardableResult
//    class func hookAfter(selector: Selector,
//                         isClassFunc: Bool = false,
//                         onlyOnce: Bool = false,
//                         error: AutoreleasingUnsafeMutablePointer<Error>? = nil,
//                         block: (_ obj: NSObject, _ result: Any, _ args: [Any]) -> Void) -> Token? {
//        var token: Token? = nil
//        performLocked {
//            guard let `class` = object_getClass(self),
//                isSelectorAllowed(class: `class`, selector: selector, error: error) else {
//                    return
//            }
//            token = Token()
//        }
//        return token
//    }
    
    // instead
//    @discardableResult
//    class func hookInstead<ReturnType>(selector: Selector,
//                                       isClassFunc: Bool = false,
//                                       onlyOnce: Bool = false,
//                                       error: AutoreleasingUnsafeMutablePointer<Error>? = nil,
//                                       block: (_ obj: NSObject, _ origin: (_ args: [Any]) -> ReturnType, _ args: [Any]) -> ReturnType) -> Token? {
//        var token: Token? = nil
//        performLocked {
//            guard let `class` = object_getClass(self),
//                isSelectorAllowed(class: `class`, selector: selector, error: error) else {
//                    return
//            }
//            token = Token()
//        }
//        return token
//    }
//    
//    // before dealloc
//    class func hookBeforeDealloc(error: AutoreleasingUnsafeMutablePointer<Error>? = nil,
//                                 block: (_ obj: NSObject) -> Void) {
//        performLocked {
//
//        }
//    }
//
//    // after dealloc
//    class func hookAfterDealloc(error: AutoreleasingUnsafeMutablePointer<Error>? = nil,
//                                block: () -> Void) {
//        performLocked {
//
//        }
//    }
    
}
