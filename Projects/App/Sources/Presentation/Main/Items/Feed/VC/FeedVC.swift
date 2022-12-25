
import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa
import Tabman

final class FeedVC: BaseVC<FeedVM>{
    
    private let tableView = UITableView()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func addView() {
        [tableView].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
 

