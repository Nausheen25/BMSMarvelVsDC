//
//  MoviesListViewModelTestCases.swift
//  BMS-MarvelVsDCTests
//
//  Created by Nausheen Khan on 28/01/23.
//

import XCTest
@testable import BMS_MarvelVsDC

final class MoviesListViewModelTestCases: XCTestCase {

    func testMoviesViewModel_GetMoviesListDataSuccess(){
        //ARRANGE
        let vm = MoviesListViewModel()
        vm.getMoviesList()
        let expectations = self.expectation(description: "testMoviesViewModel_GetMoviesListDataSuccess")
        
        //ACT
        DispatchQueue.main.asyncAfter(deadline: .now() + 10){
            XCTAssertNotNil(vm.listSections)
            XCTAssertGreaterThan(vm.listSections.count, 0)
            XCTAssertNotNil(vm.moviesListResponse)
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 15)
    }
   
}
