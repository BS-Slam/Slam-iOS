
import UIKit
import RxSwift
import RxCocoa

final class FeedVM: BaseVM{
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator){
        self.coordinator = coordinator
    }
}

extension FeedVM: ViewModelType{

    struct Input {
        
    }

    struct Output {
        
    }
}
