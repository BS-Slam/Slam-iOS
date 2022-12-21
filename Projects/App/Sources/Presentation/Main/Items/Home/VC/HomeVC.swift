
import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa
import Tabman

final class HomeVC: BaseVC<HomeVM>{
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let logoImageView = UIImageView(image: UIImage(named: "Slam_NavLogo"))
    
    private let localStatusLabel = UILabel().then{
        $0.text = "in Korea"
        $0.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        $0.textColor = .gray
    }
    
    private let bestChallengerLabel = UILabel().then{
        $0.text = "베스트 챌린지"
        $0.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        $0.textColor = .white
    }
    
    private let bestImageView = UIImageView(image: UIImage(named: "Slam_Best"))
    
    private let worldStatusLabel = UILabel().then{
        $0.text = "in World"
        $0.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        $0.textColor = .gray
    }
    
    private let bestChallengersLabel = UILabel().then{
        $0.text = "베스트 챌린지's"
        $0.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        $0.textColor = .white
    }
    
    private let mainImageView = UIImageView(image: UIImage(named: "Slam_Example"))
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func addView() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [logoImageView,localStatusLabel,bestChallengerLabel,bestImageView,worldStatusLabel,mainImageView,bestChallengersLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func setLayout() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(116)
            make.width.equalTo(65)
            make.height.equalTo(25)
            make.left.equalTo(20)
        }
        localStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom)
            make.left.equalTo(logoImageView)
            make.width.equalTo(65)
            make.height.equalTo(20)
        }
        bestChallengerLabel.snp.makeConstraints { make in
            make.top.equalTo(localStatusLabel.snp.bottom)
            make.left.equalTo(localStatusLabel)
            make.width.equalTo(155)
            make.height.equalTo(35)
        }
        bestImageView.snp.makeConstraints { make in
            make.top.equalTo(110)
            make.width.equalTo(90)
            make.height.equalTo(127)
            make.right.equalTo(-10)
        }
        mainImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bestChallengerLabel.snp.bottom).offset(12)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(465)
        }
        worldStatusLabel.snp.makeConstraints { make in
            make.left.equalTo(localStatusLabel)
            make.top.equalTo(mainImageView.snp.bottom).offset(47)
            make.width.equalTo(65)
            make.height.equalTo(20)
        }
        bestChallengersLabel.snp.makeConstraints { make in
            make.left.equalTo(worldStatusLabel)
            make.top.equalTo(worldStatusLabel.snp.bottom)
            make.width.equalTo(175)
            make.height.equalTo(35)
        }
    }
}
