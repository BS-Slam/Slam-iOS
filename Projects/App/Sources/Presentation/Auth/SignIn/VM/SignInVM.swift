
import UIKit
import RxSwift
import RxCocoa

final class SignInVM: BaseVM{
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator){
        self.coordinator = coordinator
    }
    
    func transVC(input: Input){
        
        input.signUpButtonTap.subscribe(
        onNext: pushSignUpVC
        ) .disposed(by: disposeBag)
        
        input.signInButtonTap.subscribe(
        onNext: pushTabBarVC
        ) .disposed(by: disposeBag)
    }
    
    private func pushSignUpVC(){
        coordinator.pushSignUpVC()
    }
    
    private func pushTabBarVC(){
        coordinator.pushTabBarVC()
    }
}

extension SignInVM: ViewModelType{

    struct Input {
        let signInButtonTap: Observable<Void>
        let signUpButtonTap: Observable<Void>
    }

    struct Output {
        
    }
}
