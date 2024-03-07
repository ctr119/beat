import Foundation

protocol AlbumsRepository {
    func searchAlbum(with query: String) async
}

struct AlbumsRepositoryImplementation: AlbumsRepository {
    private let albumsDataSource: AlbumsDataSource
    
    init(albumsDataSource: AlbumsDataSource) {
        self.albumsDataSource = albumsDataSource
    }
    
    func searchAlbum(with query: String) async {
        do {
            let albumSearchResultsDTO = try await albumsDataSource.search(album: query)
            print(albumSearchResultsDTO)
        } catch {
            print(error.localizedDescription)
        }
    }
}