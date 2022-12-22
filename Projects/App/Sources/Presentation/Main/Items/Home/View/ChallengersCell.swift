
import Foundation
import UIKit
import Then

class ChallengersCell : UICollectionViewCell {
     
    private let challengerImageView = UIImageView(image: UIImage(named: "Slam_Example")).then{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(challengerImageView)
        challengerImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
