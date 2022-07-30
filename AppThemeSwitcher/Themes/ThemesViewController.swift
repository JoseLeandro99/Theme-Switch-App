import UIKit

class ThemesViewController: UIViewController {
    var screen: ThemesView?
    
    override func loadView() {
        self.screen = ThemesView()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
