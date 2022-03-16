
import Foundation
struct Media : Codable {
	let media_metadata : [MediaMetadata]?

	enum CodingKeys: String, CodingKey {
		case media_metadata = "media-metadata"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		media_metadata = try values.decodeIfPresent([MediaMetadata].self, forKey: .media_metadata)
	}

}
