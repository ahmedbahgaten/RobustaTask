//
//  NetworkTests.swift
//  RobustaTaskTests
//
//  Created by Ahmed on 11/18/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import XCTest
@testable import RobustaTask
import OHHTTPStubs
class NetworkTests: XCTestCase {
    private var service:GithubRepoServices?
    
    override func setUpWithError() throws {
        service = GithubRepoServices()
    }

    override func tearDownWithError() throws {
        service = nil
    }
    
    func testGetGithubRepos() throws {
        //Given
        stub(condition: { (urlRequest) -> Bool in
            return urlRequest.url?.absoluteString.contains("/repositories") ?? false
        }) { (urlRequest) -> HTTPStubsResponse in
            let jsonObject:[[String:Any]] = [
                [
                    "name":"grit",
                    "owner":[
                        "login":"mojombo",
                        "avatar_url":"https://avatars0.githubusercontent.com/u/1?v=4",
                        "type":"User"
                    ],
                    "description":"**Grit is no longer maintained. Check out libgit2/rugged.** Grit gives you object oriented read/write access to Git repositories via Ruby."
                ],
            ]
            return HTTPStubsResponse(jsonObject: jsonObject, statusCode: 200, headers: nil)
        }
        var expectedRespose:[GithubRepo]? = nil
        let expectation = self.expectation(description: "Network call failed")
        //When
        service?.getUserRepos({ (repos) in
            expectedRespose = repos
            expectation.fulfill()
        }) { (error) in
            print("Error")
        }
        //Then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedRespose)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
