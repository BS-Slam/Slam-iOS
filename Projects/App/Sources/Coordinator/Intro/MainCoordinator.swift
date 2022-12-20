
import UIKit

class MainCoordinator: Coordinator{
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
    
    func pushSignInVC(){
        let signInVM = SignInVM(coordinator: self)
        let signInVC = SignInVC(signInVM)
        navigationController.setViewControllers([signInVC], animated: true)
    }
    
    func pushSignUpVC(){
        let signUpVM = SignUpVM(coordinator: self)
        let signUpVC = SignUpVC(signUpVM)
        navigationController.setViewControllers([signUpVC], animated: true)
    }
}
