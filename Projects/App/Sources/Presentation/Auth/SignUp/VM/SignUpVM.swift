
import UIKit
import RxSwift
import RxCocoa

final class SignUpVM: BaseVM{
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator){
        self.coordinator = coordinator
    }
}

extension SignUpVM: ViewModelType{

    struct Input {
        let signUpButtonTap: Observable<Void>
    }

    struct Output {
        
    }
}
