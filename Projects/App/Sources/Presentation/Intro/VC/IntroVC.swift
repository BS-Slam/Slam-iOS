
import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

final class IntroVC: BaseVC<IntroVM>{
    
    private let logoImageView = UIImageView(image: UIImage(named: "Slam_Logo"))
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButton(title: "취소")
    }
    
    
    override func addView() {
        view.addSubview(logoImageView)
    }
    
    override func setLayout() {
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(120)
            make.width.equalTo(280)
            make.height.equalTo(58)
        }
    }
}
