import Foundation

public enum Genre: String {
    case action = "Action"
    case adventure = "Adventure"
    case animation = "Animation"
    case crime = "Crime"
    case drama = "Drama"
    case fantasy = "Fantasy"
    case history = "History"
    case mystery = "Mystery"
    case romance = "Romance"
    case sci_fi = "Sci-Fi"
    case thriller = "Thriller"
    case war = "War"
    
    public var title: String {
        return self.rawValue
    }
}

extension Genre: Codable { }
extension Genre: Identifiable {

    public var id: String {
        self.rawValue
    }
}
