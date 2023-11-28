
import Foundation

final class NetworkManager{
    
    static let shared = NetworkManager()
    var baseURL = "https://jsonplaceholder.typicode.com/"
    
    func getItems<T: Codable> ( type: T.Type,
                                endPoint: String = "",
                                completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: baseURL + endPoint ) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data , response, error in
            if let error {
                completion(.failure(error))
            } else {
                do {
                    let items = try JSONDecoder().decode(T.self, from: data!)
                    completion(.success(items))
                }catch{
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
