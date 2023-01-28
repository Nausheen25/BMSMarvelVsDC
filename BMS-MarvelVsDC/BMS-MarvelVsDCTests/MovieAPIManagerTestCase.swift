//
//  MovieAPIManagerTestCase.swift
//  BMS-MarvelVsDCTests
//
//  Created by Nausheen Khan on 28/01/23.
//

import XCTest
@testable import BMS_MarvelVsDC

final class MovieAPIManagerTestCase: XCTestCase {
    
    func test_ServiceManager_WithValidMoviesListURL_ReturnsMoviesListResponse(){
        
        //ARRANGE
        let urlString = "https://demo2782755.mockable.io/superheroes"
        let expectation = self.expectation(description: "ValidURL_MoviesListResponse")
        
        //ACT
        APIManager().GET(requestUrl: urlString, resultType: MarvelDCResponse.self) { result in
            //ASSERT
            switch result {
            case .success(let returnedResponse):
                XCTAssertNotNil(returnedResponse)
            case .failure(let error):
                XCTAssertNil(error)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10)
    }

    
    func test_ServiceManager_WithInvalidMoviesListURLType_ReturnsErrorResponse(){
        //ARRANGE
        let urlString = "https://demo2782755.mockable.io//superheroesss"
        let expectation = self.expectation(description: "InvalidMoviesListURLType_ReturnsErrorResponse")
        
        //ACT
        APIManager().GET(requestUrl: urlString, resultType: MarvelDCResponse.self) { result in
            //ASSERT
            switch result {
            case .success(let returnedResponse):
                XCTAssertNotNil(returnedResponse)
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error.rawValue, APIErrors.invalidResponse.rawValue)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
}
