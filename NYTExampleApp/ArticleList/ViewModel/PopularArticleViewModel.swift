//
//  PopularArticleViewModel.swift
//  NYTExampleApp
//
//  Created by Mukesh Sharma on 15/03/22.
//

import Foundation


import Combine
import Foundation
import UIKit

class PopularArticleViewModel: NSObject {
    
     var articleList : Articles
    
    let service: ServiceProtocol
    init(service: ServiceProtocol = APIService()) {
        self.articleList = []
        self.service = service
    }
    
    func loadData(finished: @escaping () -> Void) {
        service.fetchArticleList(completion: {  articles in
            guard let articles = articles else {
                return
            }
            self.articleList = articles
            finished()
        })
    }
}

extension PopularArticleViewModel : UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularArticleCell", for: indexPath) as! PopularArticleCell
        cell.viewModel = PopularArticleDetailsViewModel(popularArticle: self.articleList[indexPath.row])
        return cell
    }
    
  
    
}
