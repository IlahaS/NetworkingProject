
import Foundation

final class PostViewModel{
    
    private let networkManager: NetworkManager
    var items: [Post]?
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getPost(completion: @escaping() -> Void){
        networkManager.getItems(type: [Post].self, endPoint: "posts") { result in
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
