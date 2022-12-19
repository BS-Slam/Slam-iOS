import UIKit

extension UINavigationItem {
    
    func backButton(title:String = "취소") {
        let backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        backBarButtonItem.tintColor = UIColor.white
        self.backBarButtonItem = backBarButtonItem
    }
    
    func configLeftLogo(){
        let leftLogo = UIBarButtonItem(image: SlamAsset.Images.slamNavLogo.image.withRenderingMode(.alwaysOriginal),style: .plain, target: nil, action: nil)
        self.leftBarButtonItem = leftLogo
    }
}
