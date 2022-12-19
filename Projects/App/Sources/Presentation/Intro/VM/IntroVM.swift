
import UIKit
import RxSwift
import RxCocoa

final class IntroVM:BaseVM{
    var coordinator: IntroCoordinator
    
    init(coordinator: IntroCoordinator){
        self.coordinator = coordinator
    }
    
    func transVC(input: Input){
        input.signInButtonTap.subscribe(
        onNext: <#T##((Void) -> Void)?##((Void) -> Void)?##(Void) -> Void#>
        )
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
