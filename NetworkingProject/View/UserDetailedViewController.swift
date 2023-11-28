import UIKit
import SnapKit

class UserDetailedViewController: UIViewController {
    
    var viewModel = UserViewModel(networkManager: NetworkManager.shared)
    var userId: Int?

    let usernameLabel = createLabel()
    let emailLabel = createLabel()
    let phoneLabel = createLabel()
    let companyLabel = createLabel()
    let addressLabel = createLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        if let userId = userId {
            viewModel.getUserDetails(for: userId) { [weak self] user in
                DispatchQueue.main.async {
                    guard let user = user else { return }
                    self?.usernameLabel.text = "FullName: \(user.username ?? "")"
                    self?.emailLabel.text = "Email: \(user.email ?? "")"
                    self?.phoneLabel.text = "Phone Number: \(user.phone ?? "")"
                    self?.companyLabel.text = "Company: \(user.company?.name ?? "")"
                    self?.addressLabel.text = "Address: \(user.address?.formattedAddress ?? "")"
                }
            }
        }
    }
    
    func setupView() {
        let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.alignment = .fill
            view.spacing = 15
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(usernameLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(phoneLabel)
        stackView.addArrangedSubview(companyLabel)
        stackView.addArrangedSubview(addressLabel)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    static func createLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }
}

