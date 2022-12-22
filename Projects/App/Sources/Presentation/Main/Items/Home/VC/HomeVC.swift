
import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa
import Tabman

final class HomeVC: BaseVC<HomeVM>{
    
    private var collectionView: UICollectionView!
    private var layout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .horizontal
    }
    
    private func setUpCollectionView(){
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = SlamAsset.Colors.slamBackgroundColor.color
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(ChallengersCell.self, forCellWithReuseIdentifier: "cell")
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(bestChallengersLabel.snp.bottom)
            make.left.equalTo(20)
            make.right.equalToSuperview()
            make.bottom.equalTo(-40)
        }
        self.collectionView?.translatesAutoresizingMaskIntoConstraints = false
    }
    
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
    
    private let takePicButton = UIButton().then{
        $0.setTitle("가장 웃긴 사진을 찍으세요", for: .normal)
        $0.setTitleColor(UIColor.systemGray3, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        $0.backgroundColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 0.5)
        $0.layer.cornerRadius = 18
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    override func addView() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [logoImageView,localStatusLabel,bestChallengerLabel,bestImageView,worldStatusLabel,mainImageView,bestChallengersLabel].forEach {
            contentView.addSubview($0)
        }
        mainImageView.addSubview(takePicButton)
    }
    
    override func setLayout() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.height.equalTo(1000)
            make.width.equalTo(scrollView.snp.width)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(35)
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
            make.top.equalTo(35)
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
        takePicButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(10)
            make.width.equalTo(325)
            make.height.equalTo(60)
        }
    }
}

extension HomeVC : UICollectionViewDelegate {
     
}
 
extension HomeVC : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
}
