
import UIKit

final class AlbumViewController: UIViewController {
    
    private let reusableTableView = ReusableTableView()
    let viewModel = AlbumViewModel(networkManager: NetworkManager.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reusableTableView.items = viewModel.items
        setupView()
        reusableTableView.configureCell = { cell, item in
            guard let post = item as? Album, let customCell = cell as? TableViewCell else { return }
            customCell.titleLabel.text = post.displayTitle
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
        reusableTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(reusableTableView)
    }
}
