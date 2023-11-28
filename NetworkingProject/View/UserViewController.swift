
import Foundation
import UIKit

class UserViewController: UIViewController, ReusableTableViewDelegate {
    
    private let reusableTableView = ReusableTableView()
    let viewModel = UserViewModel(networkManager: NetworkManager.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        reusableTableView.items = viewModel.items
        setupView()
        reusableTableView.configureCell = { cell, item in
            guard let post = item as? User, let customCell = cell as? TableViewCell else { return }
            customCell.titleLabel.text = post.displayTitle
            customCell.bodyLabel.text = post.email
        }
        viewModel.getUser {
            DispatchQueue.main.async {
                self.reusableTableView.items = self.viewModel.items
            }
        }
    }
    func setupView() {
        view.backgroundColor = .white
        reusableTableView.frame = view.bounds
        reusableTableView.delegate = self
        reusableTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(reusableTableView)
    }
    
    func didSelectItem(_ item: Any) {
        guard let user = item as? User, let userId = user.id else { return }
        
        let userDetailVC = UserDetailedViewController()
        userDetailVC.userId = userId
        navigationController?.pushViewController(userDetailVC, animated: true)
    }
    
}
