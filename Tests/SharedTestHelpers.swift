//
//  SharedTestHelpers.swift
//  Tests
//
//  Created by Shreya Pallan on 29/05/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation
import XCTest

func anyNSError() -> NSError {
    return NSError(domain: "any Error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

extension XCTestCase {
        func checkForMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.",file: file, line: line)
        }
    }
}
