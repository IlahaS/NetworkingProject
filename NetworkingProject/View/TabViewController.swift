
import UIKit

final class TabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }
    
    private func setUpTabs(){
        let post = self.createNav(with: "Post", and: UIImage(systemName: "house")!, and: PostViewController())
        let album = self.createNav(with: "Album", and: UIImage(systemName: "person.2.crop.square.stack")!, and: AlbumViewController())
        let photo = self.createNav(with: "Photo", and: UIImage(systemName: "photo")!, and: PhotoViewController())
        let user = self.createNav(with: "User", and: UIImage(systemName: "person")!, and: UserViewController())
        self.setViewControllers([post, album, photo, user], animated: true)
    }
    
    private func createNav(with name: String, and image: UIImage, and vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = name
        nav.tabBarItem.image = image
        return nav
    }
}
