

import Foundation
@testable import NYTExampleApp

class MockService : ServiceProtocol {
    
    func fetchArticleList( completion: @escaping ([PopularArticle]?) -> Void) {
        completion(mockData)
    }
    
    let mockData: [PopularArticle]?
    
    init(mockData: [PopularArticle]?) {
        self.mockData = mockData
    }
    
}
