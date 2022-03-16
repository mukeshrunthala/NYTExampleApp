

import XCTest
@testable import NYTExampleApp

class PopularArticleListViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccessFetchData() {
        let expectedList = [PopularArticle.with()!]
        let service = MockService(mockData: (expectedList))
        
        let viewModel = PopularArticleViewModel(service: service)
        
        
        viewModel.loadData(finished: {})
        
        XCTAssertEqual(viewModel.articleList.count, 1)
    }
    
    func testEmptyData() {
        let expectedList = [PopularArticle]()
        let service = MockService(mockData: expectedList)
        
        let viewModel = PopularArticleViewModel(service: service)
        
        
        viewModel.loadData(finished: {
        })
        
        XCTAssertEqual(viewModel.articleList.count, 0)
    }
    
    func testNilData() {
        let expectedList: [PopularArticle]? = nil
        let service = MockService(mockData: expectedList)
        let viewModel = PopularArticleViewModel(service: service)
        viewModel.loadData(finished: {
        })
    

        XCTAssertEqual(viewModel.articleList.count, 0)
    }


}
