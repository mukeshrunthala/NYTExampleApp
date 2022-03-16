

import Foundation

fileprivate let api_key = "kGaXKm4tGuocYEYmxZHA5QqOFNAtCG1o" // App key provided by NYT 


class APIService : ServiceProtocol {
    
    func fetchArticleList(completion: @escaping ([PopularArticle]?) -> Void) {
        loadData({ articles in
            completion(articles)
        })
    }
// This function is fetchinng data from the NYT api
    private func loadData(_ completion: @escaping ([PopularArticle]?) -> Void) {
        
        let url = URLConstants.popular_arical_url
        
        guard var components = URLComponents(string: url) else {
            return
        }
        components.queryItems = [URLQueryItem(name: "api-key", value: api_key)]

        guard let url = components.url else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print(request.description)
        URLSession.shared.dataTask(with: request){ (data, _, _) in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            guard let allPopularArticles = try? JSONDecoder().decode(PopularArticlesResponse.self, from: data) else {
                completion(nil)
                return
            }
            print(allPopularArticles)
            DispatchQueue.main.async {
                completion(allPopularArticles.popularArticles)
            }
            
        }.resume()
    }
    
}
