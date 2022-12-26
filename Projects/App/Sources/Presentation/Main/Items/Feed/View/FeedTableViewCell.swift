
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
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: "CollectionCell")
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
    
    private let profileIdLabel = UILabel().then{
        $0.text = "not_ j_brother"
        $0.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        $0.textColor = .white
    }
    
    private let withoutLabel = UILabel().then{
        $0.text = "외 5명"
        $0.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        $0.textColor = .white
    }
    
    
    override func setUp() {
        setUpCollectionView()
    }
    
    override func addView(){
        //self.bringSubviewToFront(heartButton)
        [heartButton,likedLabel,talkButton,shareButton,profileButton,pageControl,profileIdLabel,withoutLabel].forEach {
            self.addSubview($0)
        }
    }
    override func setLayout(){
        heartButton.snp.makeConstraints { make in
            make.top.equalTo(pageControl.snp.bottom).offset(15)
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
            make.width.equalTo(20)
            make.height.equalTo(14)
        }
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(heartButton.snp.bottom).offset(24)
            make.left.equalTo(20)
            make.size.equalTo(40)
        }
        pageControl.snp.makeConstraints { make in
            make.top.equalTo(560)
            make.centerX.equalToSuperview()
        }
        profileIdLabel.snp.makeConstraints { make in
            make.left.equalTo(profileButton.snp.right).offset(8)
            make.top.equalTo(profileButton)
            make.height.equalTo(13)
            make.width.equalTo(130)
        }
        
        withoutLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profileButton)
            make.left.equalTo(profileButton.snp.right).offset(8)
            make.height.equalTo(13)
            make.width.equalTo(50)
        }
    }
    
    @objc func pageChanged(_ sender: UIPageControl) {
        let indexPath = IndexPath(item: sender.currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
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
         
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt  section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 110, right: 0)
        
    }
}

extension FeedTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.size.width
        let x = scrollView.contentOffset.x + (width / 2.0)
        
        let newPage = Int(x / width)
        if pageControl.currentPage != newPage {
            pageControl.currentPage = newPage
        }
    }
}
