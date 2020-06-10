
import Foundation

struct NowPlayingModel : Codable {
	let page : Int?
	let total_results : Int?
	let total_pages : Int?
	var results : [Results]?

	enum CodingKeys: String, CodingKey {

		case page = "page"
		case total_results = "total_results"
		case total_pages = "total_pages"
		case results = "results"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		page = try values.decodeIfPresent(Int.self, forKey: .page)
		total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
		total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
		results = try values.decodeIfPresent([Results].self, forKey: .results)
	}

}

extension NowPlayingModel {
    
    static var nowPlaying: Resource<NowPlayingModel> = {
        
        guard let url = URL.nowPlaying else {
            fatalError("URL is not defined!")
        }
        
        return Resource<NowPlayingModel>(url: url)
    }()
}
