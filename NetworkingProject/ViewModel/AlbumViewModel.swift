
import Foundation

final class AlbumViewModel{
    
    private let networkManager: NetworkManager
    var items: [Album]?
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getPost(completion: @escaping() -> Void){
        networkManager.getItems(type: [Album].self, endPoint: "albums") { result in
            switch result {
            case .success(let items):
                self.items = items
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
