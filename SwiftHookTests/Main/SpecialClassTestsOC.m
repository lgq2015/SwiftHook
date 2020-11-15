//
//  SpecialClassTests.m
//  SwiftHookTests
//
//  Created by Yanni Wang on 15/11/20.
//  Copyright © 2020 Yanni. All rights reserved.
//

#import <XCTest/XCTest.h>
@import SwiftHook;

@interface SpecialClassTestsOC : XCTestCase

@end

@implementation SpecialClassTestsOC

//- (void)testNSTimer {
//    NSError *error = nil;
//    NSTimer *obj = [[NSTimer alloc] initWithFireDate:NSDate.now interval:11 repeats:NO block:^(NSTimer * _Nonnull timer) {
//    }];
//    XCTAssertNotNil(obj);
//    [obj sh_hookBeforeSelector:@selector(userInfo) error:&error closure:^{
//        NSLog(@"");
//    }];
//    XCTAssertNil(error);
//    id result = [obj userInfo];
//    NSLog(@"%@", result);
//}

@end
