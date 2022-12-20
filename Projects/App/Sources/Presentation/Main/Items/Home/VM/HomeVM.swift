
import UIKit
import RxSwift
import RxCocoa

final class HomeVM: BaseVM{
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator){
        self.coordinator = coordinator
    }
}

extension HomeVM: ViewModelType{

    struct Input {
        
    }

    struct Output {
        
    }
}
