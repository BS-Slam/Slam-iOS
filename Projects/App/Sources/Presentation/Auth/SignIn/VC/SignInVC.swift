
import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

final class SignInVC: BaseVC<SignInVM>{

    private let logoImageView = UIImageView(image: UIImage(named: "Slam_NavLogo"))
    
    private let loginLabel = UILabel().then{
        $0.text = "로그인"
        $0.textColor = .white
        $0.font = UIFont(name: "Helvetica-Bold", size: 48)
    }
    
    private let idTextField = UITextField().then{
        $0.backgroundColor = SlamAsset.Colors.slamTextfieldColor.color
        $0.layer.cornerRadius = 10
        $0.attributedPlaceholder = NSAttributedString(string: "아이디를 입력해주세요.", attributes:[NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        $0.textColor = UIColor.lightGray
        $0.addLeftPadding()
    }
    
    private let pwdTextField = UITextField().then{
        $0.backgroundColor = SlamAsset.Colors.slamTextfieldColor.color
        $0.layer.cornerRadius = 10
        $0.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요.", attributes:[NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        $0.textColor = UIColor.lightGray
        $0.addLeftPadding()
        $0.isSecureTextEntry = true
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
        let input = SignInVM.Input(signUpButtonTap: signUpButton.rx.tap.asObservable())
        viewModel.transVC(input: input)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    override func addView() {
        [logoImageView,loginLabel,idTextField,pwdTextField,signInButton,signUpButton,signUpLabel].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(71)
            make.width.equalTo(114)
            make.height.equalTo(44)
            make.left.equalToSuperview().offset(20)
        }
        loginLabel.snp.makeConstraints { make in
            make.centerX.equalTo(logoImageView)
            make.top.equalTo(logoImageView.snp.bottom).offset(5)
            make.width.equalTo(130)
            make.height.equalTo(57)
        }
        idTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginLabel.snp.bottom).offset(35)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        pwdTextField.snp.makeConstraints { make in
            make.centerX.equalTo(idTextField)
            make.top.equalTo(idTextField.snp.bottom).offset(15)
            make.size.equalTo(idTextField)
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
    }
}
