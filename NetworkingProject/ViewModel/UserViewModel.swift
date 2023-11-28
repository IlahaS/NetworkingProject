
import Foundation

final class UserViewModel{
    
    private let networkManager: NetworkManager
    var items: [User]?
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getUser(completion: @escaping() -> Void){
        networkManager.getItems(type: [User].self, endPoint: "users") { result in
            switch result {
            case .success(let items):
                self.items = items
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getUserDetails(for userId: Int, completion: @escaping (User?) -> Void) {
        networkManager.getItems(type: User.self, endPoint: "users/\(userId)") { result in
            switch result {
            case .success(let user):
                completion(user)
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
