//
//  MovieListTests.swift
//  Swiftui_movieTests
//
//  Created by Liem Vo on 12/1/19.
//  Copyright © 2019 Liem Vo. All rights reserved.
//

import XCTest
@testable import NYTExampleApp

class ArtisticleListTests: XCTestCase {

	func testSuccessParser() {
        let json =
        """
        {"results": [ {
        "url":"https://www.nytimes.com/2022/03/06/world/europe/ukraine-irpin-civilian-death.html",
        "published_date": "022-03-09",
        "byline": "By Henry Fountain",
        "title": "At the Bottom of an Icy Sea, One of History’s Great Wrecks Is Found",
        "abstract": "Explorers and researchers, battling freezing temperatures, have located Endurance, Ernest Shackleton’s ship that sank in the Antarctic in 1915",
        "media": [],
        }]}
        """
            .data(using: .utf8)!
		
		let artilces = try! JSONDecoder().decode(PopularArticlesResponse.self, from: json)
		
		XCTAssertNotNil(artilces)		
	}
}
