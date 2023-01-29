//
//  MarvelDCMoviesListViewControllerTestCase.swift
//  BMS-MarvelVsDCUITests
//
//  Created by Nausheen Khan on 28/01/23.
//

import XCTest
@testable import BMS_MarvelVsDC

final class MarvelDCMoviesListViewControllerTestCase: XCTestCase {


    func test_setsTableView(){
        let listVC: MarvelDCMoviesListViewController = .instantiateController(storyboard: .Main)
        _ = listVC.view
        XCTAssertNotNil(listVC.tableView)
    }
    
    
    func test_setsDataSource(){
        //ARRANGE
        let moviesVC: MarvelDCMoviesListViewController = .instantiateController(storyboard: .Main)
        _ = moviesVC.view
        //ACT
        let table = moviesVC.tableView
        //ASSERT
        XCTAssertNotNil(table)
        XCTAssertTrue(table?.dataSource === moviesVC)
        XCTAssertTrue(table?.delegate === moviesVC)
    }
    
    func test_hasDesiredNumberOfSections() {
        //ARRANGE
        let moviesVC: MarvelDCMoviesListViewController = .instantiateController(storyboard: .Main)
        _ = moviesVC.view
        moviesVC.viewModel.delegate = moviesVC
        
        //ACT
        moviesVC.viewModel.getMoviesList()
        
        let expectation = self.expectation(description: "WaitforAPIResponse")
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
           //ASSERT
            let table = moviesVC.tableView
            XCTAssertNotNil(table)
            table?.dataSource = moviesVC
            
            let numberOfSections = table?.numberOfSections
            
            XCTAssertEqual(moviesVC.viewModel.listSections.count, numberOfSections)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10)
       
    }
    
    func test_hasCorrectumberOfRowsForDCSection() {
        //ARRANGE
        let moviesVC: MarvelDCMoviesListViewController = .instantiateController(storyboard: .Main)
        _ = moviesVC.view
        moviesVC.viewModel.delegate = moviesVC
        
        //ACT
        moviesVC.viewModel.getMoviesList()
        
        let expectation = self.expectation(description: "WaitforAPIResponse")
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
           //ASSERT
            let table = moviesVC.tableView
            XCTAssertNotNil(table)
            table?.dataSource = moviesVC
            
            let sectionDCIndex = moviesVC.viewModel.listSections.firstIndex(where: {$0 == .DC})
            if sectionDCIndex != nil{
                XCTAssertEqual(moviesVC.viewModel.moviesListResponse?.dc?.count, table?.numberOfRows(inSection: sectionDCIndex ?? 0))
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
    func test_hasCorrectumberOfRowsForMarvelSection() {
        //ARRANGE
        let moviesVC: MarvelDCMoviesListViewController = .instantiateController(storyboard: .Main)
        _ = moviesVC.view
        moviesVC.viewModel.delegate = moviesVC
        
        //ACT
        moviesVC.viewModel.getMoviesList()
        
        let expectation = self.expectation(description: "WaitforAPIResponse")
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
           //ASSERT
            let table = moviesVC.tableView
            XCTAssertNotNil(table)
            table?.dataSource = moviesVC
            
            let sectionMarvelIndex = moviesVC.viewModel.listSections.firstIndex(where: {$0 == .Marvel})
            if sectionMarvelIndex != nil{
                XCTAssertEqual(1, table?.numberOfRows(inSection: sectionMarvelIndex ?? 0))
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
}
