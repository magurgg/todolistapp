//
//  JsonPlaceholderAppTests.swift
//  JsonPlaceholderAppTests
//
//  Created by marco.gutierrez on 31/10/23.
//

import XCTest

/// Test class for JsonPlaceholderApp.
final class JsonPlaceholderAppTests: XCTestCase {

    var networkClient: NetworkClient!

    override func setUp() {
        super.setUp()

        networkClient = NetworkClient()
    }

    func testToDos() async throws {
        let response = try await networkClient.getToDos()
        XCTAssertNoThrow(response)
    }
}
