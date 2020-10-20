//  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0.

import XCTest
import AwsCommonRuntimeKit

class CrtXCBaseTestCase: XCTestCase {
    internal let allocator = TracingAllocator(tracingBytesOf: defaultAllocator)

    override func setUp() {
        super.setUp()
        AwsCommonRuntimeKit.initialize(allocator: self.allocator)
    }

    override func tearDown() {
        AwsCommonRuntimeKit.cleanUp()
        allocator.dump()
        
        XCTAssertEqual(allocator.count, 0,
                       "Memory was leaked: \(allocator.bytes) bytes in \(allocator.count) allocations")
        super.tearDown()
    }
}

extension XCTestCase {
   func skipIfiOS() throws {
      if #available(iOS 10, *)  {
         throw XCTSkip("Skipping test on iOS")
      }
   }
    
    func skipifmacOS() throws {
        if #available(macOS 10.14, *) {
            throw XCTSkip("Skipping test on macOS")
        }
    }
}
