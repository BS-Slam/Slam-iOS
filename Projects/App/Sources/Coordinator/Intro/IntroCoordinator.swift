
import UIKit

class IntroCoordinator: Coordinator{
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        window.rootViewController = navigationController
    }

    func start() {
        let introVM = IntroVM(coordinator: self)
        let introVC = IntroVC(introVM)
        navigationController.setViewControllers([introVC], animated: true)
    }
}
