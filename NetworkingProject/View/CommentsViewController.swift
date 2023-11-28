import UIKit

class CommentsViewController: UIViewController {
    
    private let reusableTableView = ReusableTableView()
    var viewModel: CommentViewModel = CommentViewModel(networkManager: NetworkManager.shared)
    var postId: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        reusableTableView.configureCell = { cell, item in
            guard let post = item as? Comment, let customCell = cell as? TableViewCell else { return }
            customCell.titleLabel.text = post.displayTitle
            customCell.bodyLabel.text = post.body
        }
        fetchComments()
        reusableTableView.items = viewModel.items
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(reusableTableView)
        reusableTableView.frame = view.bounds
        reusableTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        reusableTableView.delegate = self
    }
    
    func fetchComments() {
        guard let postId = postId else { return }
        viewModel.postId = postId
        viewModel.getComment() { [weak self] in
            self?.reusableTableView.items = self?.viewModel.items
        }
    }
}

extension CommentsViewController: ReusableTableViewDelegate {
    func didSelectItem(_ item: Any) {
        
    }
}


