
import UIKit
import RxSwift
import RxCocoa

final class ChatVM: BaseVM{
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator){
        self.coordinator = coordinator
    }
}

extension ChatVM: ViewModelType{

    struct Input {
        
    }

    struct Output {
        
    }
}
