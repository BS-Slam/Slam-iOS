
import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

final class SignUpVC: BaseVC<SignUpVM>{
    
    private let authLabel = UILabel().then{
        $0.text = "본인인증"
        $0.font = UIFont(name: "Helvetica-Bold", size: 15)
        $0.textColor = .white
    }
    
    private let emailTextField = UITextField().then{
        $0.backgroundColor = SlamAsset.Colors.slamTextfieldColor.color
        $0.layer.cornerRadius = 10
        $0.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요.", attributes:[NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        $0.textColor = UIColor.lightGray
        $0.addLeftPadding()
        $0.addRightPadding()
    }
    
    private let emailChangeButton = UIButton().then{
        $0.layer.cornerRadius = 18
        $0.setTitle("인증", for: .normal)
        $0.setTitleColor(SlamAsset.Colors.slamMainColor.color, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 13)
        $0.addTarget(self, action: #selector(authButtonDidTap), for: .touchUpInside)
    }
    
    private let authTextField = UITextField().then{
        $0.backgroundColor = SlamAsset.Colors.slamTextfieldColor.color
        $0.layer.cornerRadius = 10
        $0.attributedPlaceholder = NSAttributedString(string: "받으신 인증번호를 입력해주세요.", attributes:[NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        $0.textColor = UIColor.lightGray
        $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        $0.addLeftPadding()
        $0.addRightPadding()
    }
    
    private let authButton = UIButton().then{
        $0.layer.cornerRadius = 18
        $0.setTitle("재전송", for: .normal)
        $0.setTitleColor(SlamAsset.Colors.slamMainColor.color, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 13)
    }
    
    private let timerLabel = UILabel().then{
        $0.text = "3:00"
        $0.font = UIFont(name: "Helvetica-Bold", size: 15)
        $0.textColor = SlamAsset.Colors.slamMainColor.color
    }
    
    private let infoLabel = UILabel().then{
        $0.text = "계정 정보"
        $0.font = UIFont(name: "Helvetica-Bold", size: 15)
        $0.textColor = .white
    }
    
    private let pwdTextField = UITextField().then{
        $0.backgroundColor = SlamAsset.Colors.slamTextfieldColor.color
        $0.layer.cornerRadius = 10
        $0.attributedPlaceholder = NSAttributedString(string: "사용하실 비밀번호를 입력해주세요.", attributes:[NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        $0.textColor = UIColor.lightGray
        $0.isSecureTextEntry = true
        $0.addLeftPadding()
        $0.addRightPadding()
    }
    
    private let okButton = UIButton().then{
        $0.layer.cornerRadius = 18
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(SlamAsset.Colors.slamMainColor.color, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 13)
        $0.addTarget(self, action: #selector(okButtonDidTap), for: .touchUpInside)
    }
    
    private let rePwdTextField = UITextField().then{
        $0.backgroundColor = SlamAsset.Colors.slamTextfieldColor.color
        $0.layer.cornerRadius = 10
        $0.attributedPlaceholder = NSAttributedString(string: "사용하실 비밀번호를 입력해주세요.", attributes:[NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        $0.textColor = UIColor.lightGray
        $0.isSecureTextEntry = true
        $0.addLeftPadding()
        $0.addRightPadding()
    }
    
    private let pwdOkButton = UIButton().then{
        $0.layer.cornerRadius = 18
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(SlamAsset.Colors.slamMainColor.color, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 13)
        $0.addTarget(self, action: #selector(pwdOkButtonDidTap), for: .touchUpInside)
    }
    
    private let nickNameTextField = UITextField().then{
        $0.backgroundColor = SlamAsset.Colors.slamTextfieldColor.color
        $0.layer.cornerRadius = 10
        $0.attributedPlaceholder = NSAttributedString(string: "닉네임을 입력해주세요.", attributes:[NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        $0.textColor = UIColor.lightGray
        $0.addLeftPadding()
        $0.addRightPadding()
    }
    
    private let validationButton = UIButton().then{
        $0.layer.cornerRadius = 18
        $0.setTitle("중복 확인", for: .normal)
        $0.setTitleColor(SlamAsset.Colors.slamMainColor.color, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 13)
        $0.addTarget(self, action: #selector(validationButtonDidTap), for: .touchUpInside)
    }
    
    private let statusLabel = UILabel().then{
        $0.text = "사용가능한 닉네임이에요."
        $0.font = UIFont(name: "Helvetica", size: 13)
        $0.textColor = .lightGray
    }
    
    private let signUpButton = UIButton().then{
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 18
        $0.setTitle("가입", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        $0.isEnabled = false
    }
    
    private func bindViewModel(){
        let input = SignUpVM.Input(signUpButtonTap: signUpButton.rx.tap.asObservable())
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
        [authLabel,emailTextField,signUpButton].forEach {
            view.addSubview($0)
        }
        emailTextField.addSubview(emailChangeButton)
    }
    
    override func setLayout() {
        authLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.left.equalTo(27)
            make.width.equalTo(52)
            make.height.equalTo(20)
        }
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(authLabel.snp.bottom).offset(10)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        emailChangeButton.snp.makeConstraints { make in
            make.width.equalTo(45)
            make.height.equalTo(16)
            make.right.equalTo(-18)
            make.top.equalTo(18)
        }
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(74)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    @objc func authButtonDidTap(){
        view.addSubview(authTextField)
        authTextField.snp.makeConstraints { make in
            make.centerX.equalTo(emailTextField)
            make.width.height.equalTo(emailTextField)
            make.top.equalTo(emailTextField.snp.bottom).offset(12)
        }
        emailChangeButton.setTitle("변경", for: .normal)
        emailTextField.isUserInteractionEnabled = false
        authTextField.addSubview(authButton)
        authButton.snp.makeConstraints { make in
            make.width.equalTo(45)
            make.height.equalTo(16)
            make.right.equalTo(-18)
            make.top.equalTo(18)
        }
        authTextField.addSubview(timerLabel)
        timerLabel.snp.makeConstraints { make in
            make.width.equalTo(35)
            make.top.equalTo(18)
            make.left.equalTo(authButton.snp.right).offset(-80)
            make.height.equalTo(16)
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(authTextField.snp.bottom).offset(35)
            make.left.equalTo(27)
            make.width.equalTo(60)
            make.height.equalTo(20)
        }
        view.addSubview(pwdTextField)
        pwdTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(infoLabel.snp.bottom).offset(10)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        emailTextField.isUserInteractionEnabled = false
        emailChangeButton.setTitleColor(.lightGray, for: .normal)
        emailChangeButton.setTitle("인증완료", for: .normal)
        
        authTextField.isUserInteractionEnabled = false
        authButton.setTitleColor(.lightGray, for: .normal)
        authButton.setTitle("인증완료", for: .normal)
        timerLabel.text = ""
        pwdTextField.addSubview(okButton)
        okButton.snp.makeConstraints { make in
            make.width.equalTo(23)
            make.height.equalTo(16)
            make.right.equalTo(-18)
            make.top.equalTo(18)
        }
    }
    
    @objc func okButtonDidTap(){
        view.addSubview(rePwdTextField)
        rePwdTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pwdTextField.snp.bottom).offset(12)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        okButton.setTitle("변경", for: .normal)
        rePwdTextField.addSubview(pwdOkButton)
        pwdOkButton.snp.makeConstraints { make in
            make.width.equalTo(23)
            make.height.equalTo(16)
            make.right.equalTo(-18)
            make.top.equalTo(18)
        }
    }
    
    @objc func pwdOkButtonDidTap(){
        view.addSubview(nickNameTextField)
        nickNameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(rePwdTextField.snp.bottom).offset(24)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        nickNameTextField.addSubview(validationButton)
        validationButton.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(16)
            make.right.equalTo(-18)
            make.top.equalTo(18)
        }
    }
    
    @objc func validationButtonDidTap(){
        view.addSubview(statusLabel)
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(nickNameTextField.snp.bottom).offset(12)
            make.width.equalTo(135)
            make.height.equalTo(16)
            make.left.equalTo(40)
        }
        signUpButton.backgroundColor = SlamAsset.Colors.slamMainColor.color
        signUpButton.isEnabled = true
    }
}
