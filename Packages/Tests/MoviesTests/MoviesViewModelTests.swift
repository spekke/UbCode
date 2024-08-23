import Clients
import DataModels
import Dependencies
import XCTest
import Combine
@testable import Movies


final class MoviesViewModelTests: XCTestCase {
    
    var disposeBag: Set<AnyCancellable> = []
    
    override func setUp() {
        disposeBag = []
    }
    
    @MainActor
    func testFetchData_noCachedMovies() async throws {
        
        let fetchableMovies: [Movie] = [
            Movie(id: "1", title: "Movie 1", plot: "Plot 1", poster: nil, genres: []),
            Movie(id: "2", title: "Movie 2", plot: "Plot 2", poster: nil, genres: []),
        ]
        
        let sut = withDependencies {
            $0.cacheClient = .inMemory()
            $0.apiClient.fetchMovies = { fetchableMovies }
        } operation: {
            MoviesViewModel()
        }
        
        var publishedMovies: [[Movie]] = []
        
        sut.$movies
            .sink { publishedMovies.append($0) }
            .store(in: &disposeBag)
        
        await sut.fetchData()
        
        XCTAssertEqual(publishedMovies[0], [])
        XCTAssertEqual(publishedMovies[1], fetchableMovies)
    }
    
    @MainActor
    func testFetchData_cachedMovies() async throws {
        
        let cachedMovies: [Movie] = [
            Movie(id: "1", title: "Movie 1", plot: "Plot 1", poster: nil, genres: []),
            Movie(id: "2", title: "Movie 2", plot: "Plot 2", poster: nil, genres: []),
        ]
        
        let fetchableMovies: [Movie] = [
            Movie(id: "1", title: "Movie 1", plot: "Plot 1", poster: nil, genres: []),
            Movie(id: "2", title: "Movie 2", plot: "Plot 2", poster: nil, genres: []),
            Movie(id: "3", title: "Movie 3", plot: "Plot 3", poster: nil, genres: []),
            Movie(id: "4", title: "Movie 4", plot: "Plot 4", poster: nil, genres: [])
        ]
        
        let sut = withDependencies {
            $0.cacheClient = .inMemory(movies: cachedMovies)
            $0.apiClient.fetchMovies = { fetchableMovies }
        } operation: {
            MoviesViewModel()
        }
        
        var publishedMovies: [[Movie]] = []
        
        sut.$movies
            .sink { publishedMovies.append($0) }
            .store(in: &disposeBag)
        
        await sut.fetchData()
        
        XCTAssertEqual(publishedMovies[0], [])
        XCTAssertEqual(publishedMovies[1], cachedMovies)
        XCTAssertEqual(publishedMovies[2], fetchableMovies)
    }
}
