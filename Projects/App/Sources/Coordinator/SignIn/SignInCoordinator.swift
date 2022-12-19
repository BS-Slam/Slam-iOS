
import UIKit

class SignInCoordinator: Coordinator{
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        window.rootViewController = navigationController
    }
    func start() {
        
    }
}
