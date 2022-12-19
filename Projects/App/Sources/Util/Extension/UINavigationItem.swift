import UIKit

extension UINavigationItem {
    
    func backButton(title:String = "취소") {
        let backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        backBarButtonItem.tintColor = UIColor.white
        self.backBarButtonItem = backBarButtonItem
    }
}
