
import UIKit
import RxSwift
import RxCocoa

final class SignInVM: BaseVM{
    var coordinator: IntroCoordinator
    
    init(coordinator: IntroCoordinator){
        self.coordinator = coordinator
    }
}

extension SignInVM: ViewModelType{

    struct Input {
        let signInButtonTap: Observable<Void>
    }

    struct Output {
        
    }
}
