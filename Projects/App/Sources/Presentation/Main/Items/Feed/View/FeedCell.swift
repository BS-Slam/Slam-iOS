
import Foundation
import UIKit
import Then

final class FeedCell: UICollectionViewCell {
     
    private let feedImageView = UIImageView(image: UIImage(named: "Slam_FeedExample")).then{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(feedImageView)
        feedImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
