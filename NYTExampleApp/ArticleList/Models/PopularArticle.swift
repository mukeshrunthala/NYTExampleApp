
import Foundation

struct PopularArticle : Codable {
	let url : String?
	let published_date : String?
	let byline : String?
	let title : String?
	let abstract : String?
	let media : [Media]?

	enum CodingKeys: String, CodingKey {
		case url = "url"
		case published_date = "published_date"
		case byline = "byline"
		case title = "title"
		case abstract = "abstract"
		case media = "media"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		published_date = try values.decodeIfPresent(String.self, forKey: .published_date)
		byline = try values.decodeIfPresent(String.self, forKey: .byline)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		abstract = try values.decodeIfPresent(String.self, forKey: .abstract)
		media = try values.decodeIfPresent([Media].self, forKey: .media)
	}

}
