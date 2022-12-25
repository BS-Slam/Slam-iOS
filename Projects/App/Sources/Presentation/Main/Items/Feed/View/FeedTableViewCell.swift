
import Foundation
import UIKit
import Then
import SnapKit


final class FeedTableViewCell: BaseTableViewCell{
    
    private var collectionView: UICollectionView!
    private var layout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .horizontal
    }
    
    private func setUpCollectionView(){
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = SlamAsset.Colors.slamBackgroundColor.color
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: "cell")
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(150)
            make.left.right.equalToSuperview()
        }
        self.collectionView?.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let takePicButton = UIButton().then{
        $0.setTitle("가장 웃긴 사진을 찍으세요", for: .normal)
        $0.setTitleColor(UIColor.systemGray3, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        $0.backgroundColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 0.5)
        $0.layer.cornerRadius = 18
    }
    
    private let pageControl = UIPageControl().then{
        $0.numberOfPages = 3
        $0.currentPage = 0
        $0.pageIndicatorTintColor = UIColor.systemGray
        $0.currentPageIndicatorTintColor = UIColor.systemRed
    }
    
    private let heartButton = UIButton().then{
        $0.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        $0.tintColor = .lightGray
    }
    
    private let likedLabel = UILabel().then{
        $0.text = "10,000명이 이챌린지를 좋아해요."
        $0.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        $0.textColor = .white
    }
    
    private let talkButton = UIButton().then{
        $0.setImage(UIImage(systemName: "ellipsis.bubble.fill"), for: .normal)
        $0.tintColor = .lightGray
    }
    
    private let shareButton = UIButton().then{
        $0.setImage(UIImage(systemName: "arrowshape.turn.up.right.fill"), for: .normal)
        $0.tintColor = .lightGray
    }
    
    private let profileButton = UIButton().then{
        $0.setImage(UIImage(named: "Slam_Example"), for: .normal)
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .black
        $0.clipsToBounds = true
    }
    
    private let profileIdLabel = UILabel()
    
    override func setUp(){}
    override func addView(){
        self.bringSubviewToFront(heartButton)
        [heartButton,likedLabel,talkButton,shareButton,profileButton].forEach {
            self.addSubview($0)
        }
    }
    override func setLayout(){
        heartButton.snp.makeConstraints { make in
            make.top.equalTo(710)
            make.left.equalTo(23)
            make.width.equalTo(20)
            make.height.equalTo(15)
        }
        likedLabel.snp.makeConstraints { make in
            make.centerY.equalTo(heartButton)
            make.left.equalTo(heartButton.snp.right).offset(8)
            make.width.equalTo(170)
            make.height.equalTo(13)
        }
        talkButton.snp.makeConstraints { make in
            make.centerY.equalTo(likedLabel)
            make.left.equalTo(likedLabel.snp.right).offset(97)
            make.size.equalTo(20)
        }
        shareButton.snp.makeConstraints { make in
            make.centerY.equalTo(talkButton)
            make.left.equalTo(talkButton.snp.right).offset(13)
            make.width.equalTo(18)
            make.height.equalTo(14)
        }
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(heartButton.snp.bottom).offset(24)
            make.left.equalTo(20)
            make.size.equalTo(40)
        }
    }
}

extension FeedVC : UICollectionViewDelegate {
     
}

extension FeedTableViewCell : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 520)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
}
