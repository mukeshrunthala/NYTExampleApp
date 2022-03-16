//
//  PopularArticleListDataSourceTest.swift
// NYTExampleAppTests
//
//  Created by Mukesh Sharma on 16/03/12.
//

import XCTest
@testable import NYTExampleApp

class PopularArticleListDataSourceTest: XCTestCase {
    
    func testEmptyValueInDataSource() {
          
        let expectedList : Array<PopularArticle> = []
        let service = MockService(mockData: (expectedList))
        let viewModel = PopularArticleViewModel(service: service)
        let tableView = UITableView()
        tableView.dataSource = viewModel
        
        viewModel.loadData(finished: {
            XCTAssertEqual(tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
        })
      }

    func testValueInDataSource() {
        let expectedList = [PopularArticle.with()!]
        let service = MockService(mockData: (expectedList))
        let viewModel = PopularArticleViewModel(service: service)
        let tableView = UITableView()
        tableView.dataSource = viewModel
        
        viewModel.loadData(finished: {
            
            // expected one cell
            XCTAssertEqual(tableView.dataSource!.tableView(tableView, numberOfRowsInSection: 0), 1, "Expected one cell in table view")

        })
    }


}
