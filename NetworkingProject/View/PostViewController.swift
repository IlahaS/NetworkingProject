
import UIKit

final class PostViewController: UIViewController, ReusableTableViewDelegate {
    
    private let reusableTableView = ReusableTableView()
    let viewModel = PostViewModel(networkManager: NetworkManager.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reusableTableView.items = viewModel.items
        setupView()
        reusableTableView.configureCell = { cell, item in
            guard let post = item as? Post, let customCell = cell as? TableViewCell else { return }
            customCell.titleLabel.text = post.displayTitle
            customCell.bodyLabel.text = post.body
        }
        viewModel.getPost {
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
        guard let post = item as? Post else { return }
        let postId = post.id
        let commentsVC = CommentsViewController()
        commentsVC.postId = postId
        navigationController?.pushViewController(commentsVC, animated: true)
    }
}
