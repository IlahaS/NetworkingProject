
import Foundation

final class CommentViewModel{
    var postId: Int?
    var items: [Comment]?
    private let networkManager: NetworkManager
    
    init (networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getComment(completion: @escaping () -> Void) {
        guard let postId = postId else { return }
        networkManager.getItems(type: [Comment].self, endPoint: "comments?postId=\(postId)") { result in
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
