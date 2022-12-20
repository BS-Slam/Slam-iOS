
import UIKit
import RxSwift
import RxCocoa

final class SignUpVM: BaseVM{
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator){
        self.coordinator = coordinator
    }
    
    func transVC(input: Input){
        input.signUpButtonTap.subscribe(
        onNext: pushSignInVC
        ) .disposed(by: disposeBag)
    }
    
    private func pushSignInVC(){
        coordinator.pushSignInVC()
    }
}

extension SignUpVM: ViewModelType{

    struct Input {
        let signUpButtonTap: Observable<Void>
    }

    struct Output {
        
    }
}
