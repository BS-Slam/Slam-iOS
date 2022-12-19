
import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

final class IntroVC: BaseVC<IntroVM>{
    
    private let logoImageView = UIImageView(image: UIImage(named: "Slam_Logo"))
    
    private let mainLabel = UILabel().then{
        $0.text = "매일 SLAM만의 챌린지를 친구들과 해봐!"
        $0.font = UIFont(name: "Helvetica-Bold", size: 13)
        $0.textColor = UIColor.white
        $0.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 18.5)
    }
    
    private let signInButton = UIButton().then{
        $0.backgroundColor = SlamAsset.Colors.slamMainColor.color
        $0.layer.cornerRadius = 18
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
    }
    
    private let signUpLabel = UILabel().then{
        $0.text = "SLAM이 처음이신가요?"
        $0.font = UIFont(name: "Helvetica", size: 13)
        $0.textColor = UIColor.white
    }
    
    private let signUpButton = UIButton().then{
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(SlamAsset.Colors.slamMainColor.color, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Helvetica", size: 13)
    }
    
    private func bindViewModel(){
        let input = IntroVM.Input(signInButtonTap: signInButton.rx.tap.asObservable(), signUpButtonTap: signUpButton.rx.tap.asObservable())
        viewModel.transVC(input: input)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        self.navigationItem.backButton(title: "취소")
    }
    
    
    override func addView() {
        [logoImageView,signInButton,signUpLabel,signUpButton,mainLabel].forEach {
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
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(74)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        signUpLabel.snp.makeConstraints { make in
            make.left.equalTo(109)
            make.top.equalTo(signInButton.snp.bottom).offset(16)
            make.width.equalTo(130)
            make.height.equalTo(15)
        }
        signUpButton.snp.makeConstraints { make in
            make.centerY.equalTo(signUpLabel)
            make.left.equalTo(signUpLabel.snp.right).offset(5)
            make.width.equalTo(50)
            make.height.equalTo(15)
        }
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).inset(10)
            make.width.equalTo(242)
            make.height.equalTo(15)
        }
    }
}
