
import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

final class IntroVC: BaseVC<IntroVM>{
    
    private let logoImageView = UIImageView(image: UIImage(named: "Slam_Logo"))
    
    private let signInButton = UIButton().then{
        $0.backgroundColor = SlamAsset.Colors.slamMainColor.color
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButton(title: "취소")
    }
    
    
    override func addView() {
        [logoImageView,signInButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(70)
            make.width.equalTo(300)
            make.height.equalTo(156)
        }
        
    }
}
