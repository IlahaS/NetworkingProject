import Foundation

class PhotoViewModel {
    private let networkManager: NetworkManager
    var photos: [Photo]?
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getPhotos(completion: @escaping () -> Void) {
        networkManager.getItems(type: [Photo].self, endPoint: "photos") { [weak self] result in
            switch result {
            case .success(let photos):
                self?.photos = photos
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
