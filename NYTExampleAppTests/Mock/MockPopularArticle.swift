
import Foundation
@testable import NYTExampleApp

extension PopularArticle {
    static func with() -> PopularArticle? {
        
        let json =
        """
                        {
                        "url":"https://www.nytimes.com/2022/03/06/world/europe/ukraine-irpin-civilian-death.html",
                        "published_date": "022-03-09",
                        "byline": "By Henry Fountain",
                        "title": "At the Bottom of an Icy Sea, One of History’s Great Wrecks Is Found",
                        "abstract": "Explorers and researchers, battling freezing temperatures, have located Endurance, Ernest Shackleton’s ship that sank in the Antarctic in 1915",
                        "media": [],
                        }
        """
        
        do {
                
          if  let jsonData = json.data(using: .utf8) {
                let decodedData = try JSONDecoder().decode(PopularArticle.self,
                                                                   from: jsonData)
                return decodedData
                }
            } catch {
                print(error)
            }
        return nil
    }
}
