//
//  PopularArticleDetailsViewModel.swift
//  NYTExampleApp
//
//  Created by Mukesh Sharma on 16/03/22.
//

import Foundation

class PopularArticleDetailsViewModel: NSObject {
     var heading:String
     var name:String
     var date:String
     var image:String?
     var detailImage:String?
     var details:String?

    
    init(popularArticle: PopularArticle) {
         heading = popularArticle.title ?? ""
         name = popularArticle.byline  ?? ""
         date = popularArticle.published_date ?? ""
        details = popularArticle.abstract ?? ""
        image = popularArticle.media?.count ?? 0 > 0 ? popularArticle.media?.first?.media_metadata?.count ?? 0 > 0 ? popularArticle.media?.first?.media_metadata?.first?.url:"":""
        detailImage = popularArticle.media?.count ?? 0 > 0 ? popularArticle.media?.first?.media_metadata?.count ?? 0 > 0 ? popularArticle.media?.first?.media_metadata?.last?.url:"":""
    }
}
