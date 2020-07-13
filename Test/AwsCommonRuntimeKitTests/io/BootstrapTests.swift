//  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0.
import XCTest
@testable import AwsCommonRuntimeKit

class BootstrapTests: CrtXCBaseTestCase {

  func testCanCreateBootstrap() throws {
    let elg = try EventLoopGroup(allocator: allocator)
    let resolver = try DefaultHostResolver(eventLoopGroup: elg, maxHosts: 8, maxTTL: 30, allocator: allocator)
    let _ = try ClientBootstrap(eventLoopGroup: elg, hostResolver: resolver, allocator: allocator)
  }
}


