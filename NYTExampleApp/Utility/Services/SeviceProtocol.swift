

import Foundation

protocol ServiceProtocol {
    func fetchArticleList(completion: @escaping ([PopularArticle]?) -> Void)
}
