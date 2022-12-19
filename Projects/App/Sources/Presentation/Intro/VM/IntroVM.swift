
import UIKit
import RxSwift
import RxCocoa

final class IntroVM: BaseVM{
    var coordinator: IntroCoordinator
    
    init(coordinator: IntroCoordinator){
        self.coordinator = coordinator
    }
}

extension IntroVM: ViewModelType{

    struct Input {
        let signInButtonTap: Observable<Void>
        let signUpButtonTap: Observable<Void>
    }

    struct Output {
        
    }
}
