

import Foundation
import UIKit

class PhotoDetailedViewController: UIViewController{
    var imageURL: URL?
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if let imageURL = imageURL {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageURL) {
                    DispatchQueue.main.async {
                        self.photoImageView.image = UIImage(data: imageData)
                    }
                }
            }
            view.addSubview(photoImageView)
            photoImageView.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            
        }
    }
}
